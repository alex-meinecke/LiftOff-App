//
//  LaunchScreenViewModel.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 31.03.25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var launchDetailViewModels: [LaunchDetailViewModel] = []
    @Published var nextUpcomingLaunchViewModel: LaunchDetailViewModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showLaunches = true
    
    @Published var upcomingLaunchesOverview: [CustomLaunchAPI.UpcomingLaunchesOverviewQuery.Data.UpcomingLaunch] = []
    
    @Published var countdown = "0:0:0:0"
    
    private let apolloService: ApolloService
    
    var timer: AnyCancellable?
    
    init(apolloService: ApolloService = .shared) {
        self.apolloService = apolloService
        loadLauchesOverview()
        getNextUpcomingLaunch()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.loadLauchesOverview()

        }
    }
    
    func loadLauchesOverview() {
        isLoading = true
        
        apolloService.fetchUpcomingLaunchOverview { result in
            switch result {
            case .success(let data):
                self.setupDetailViewModels(launches: data.upcomingLaunches)
            case .failure(let error):
                print("Error fetching launches: \(error.localizedDescription)")
            }
            
        }
    }
    
    func setupDetailViewModels(launches: [CustomLaunchAPI.UpcomingLaunchesOverviewQuery.Data.UpcomingLaunch]) {
        self.launchDetailViewModels.removeAll()
        
        for launch in launches {
            let detailViewModel = LaunchDetailViewModel(launchOverview: launch)
            self.launchDetailViewModels.append(detailViewModel)
        }
        
        self.launchDetailViewModels.first?.startCountdown()
    }
    
    func getNextUpcomingLaunch() {
        guard launchDetailViewModels.count > 1 else { return }
        
        launchDetailViewModels = launchDetailViewModels.sorted(by: { $0.formatLaunchTimeString() < $1.formatLaunchTimeString() })
        
        for launch in launchDetailViewModels {
            if launch.formatLaunchTimeString().timeIntervalSince1970 > Date().timeIntervalSince1970 {
                nextUpcomingLaunchViewModel = launch
                launch.startCountdown()
                timer = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common)
                    .autoconnect()
                    .sink(receiveValue: { [weak self] _ in
                        self?.countdown = launch.launchCountdown
                    })
                return
            }
        }
        
        
    }

}
