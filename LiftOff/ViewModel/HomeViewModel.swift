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
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var upcomingLaunchesOverview: [CustomLaunchAPI.UpcomingLaunchesOverviewQuery.Data.UpcomingLaunch] = []
    
    
    private let apolloService: ApolloService
    
    var timer: AnyCancellable?
    
    init(apolloService: ApolloService = .shared) {
        self.apolloService = apolloService
        loadLauchesOverview()
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
        for launch in launches {
            let detailViewModel = LaunchDetailViewModel(launchOverview: launch)
            self.launchDetailViewModels.append(detailViewModel)
        }
        
        self.launchDetailViewModels.first?.startCountdown()
    }

}
