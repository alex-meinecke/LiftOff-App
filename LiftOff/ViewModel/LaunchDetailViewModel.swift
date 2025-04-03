//
//  LaunchDetailViewModel.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 02.04.25.
//

import Foundation
import Combine
import MapKit
import _MapKit_SwiftUI

class LaunchDetailViewModel: ObservableObject, Identifiable {
    @Published var launch: CustomLaunchAPI.GetLaunchQuery.Data.Launch?
    var launchOverview: CustomLaunchAPI.UpcomingLaunchesOverviewQuery.Data.UpcomingLaunch
    
    @Published var launchCountdown = "0:0:0:0"
    
    @Published var padPosition: MapCameraPosition = .region(MKCoordinateRegion())
    
    @Published var isLoading: Bool = false
    
    var timer: AnyCancellable?
    
    private let apolloService: ApolloService
    
    init(launchOverview: CustomLaunchAPI.UpcomingLaunchesOverviewQuery.Data.UpcomingLaunch, apolloService: ApolloService = .shared) {
        self.launchOverview = launchOverview
        self.apolloService = apolloService
    }
    
    func initializeFullViewModel() {
        self.isLoading = true

        apolloService.fetchLaunch(launchId: launchOverview.id) { result in
            switch result {
                case .success(let data):
                self.launch = data.launch
                self.setupMap()
                self.isLoading = false
                case .failure(let error):
                print("Error fetching launch: \(error)")
            
            }
        }
        
    }
    
    func setupMap() {
        guard let launch else { return }
        
        padPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: launch.pad.latitude, longitude: launch.pad.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        )
    }
    
    func formatLaunchTimeString() -> Date {
        guard let launchDate = ISO8601DateFormatter().date(from: launchOverview.net) else {
            print("Error parsing launch date string: \(launchOverview.net)")
            return Date()
        }
        
        return launchDate
    }
    
    func startCountdown() {
        let launchDate = formatLaunchTimeString()
        
        timer = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] date in
                self?.updateLaunchCountdown(for: launchDate, now: date)
            }
        
    }
    
    func updateLaunchCountdown(for launchDate: Date, now: Date = Date()) {
        let timeDiffrence = Int(launchDate.timeIntervalSince1970 - now.timeIntervalSince1970)

        let days = Int(timeDiffrence / 86400)
        let hours = Int((timeDiffrence - days * 86400) / 3600)
        let minutes = Int((timeDiffrence - days * 86400 - hours * 3600) / 60)
        let seconds = Int(timeDiffrence - days * 86400 - hours * 3600 - minutes * 60)
        
        launchCountdown = "\(days):\(hours):\(minutes):\(seconds)"
    }
    
    
}
