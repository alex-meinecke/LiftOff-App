//
//  LaunchScreenViewModel.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 31.03.25.
//

import Foundation


class LaunchScreenViewModel: ObservableObject {
    @Published var launches: [CustomLaunchAPI.UpcomingLaunchesQuery.Data.UpcomingLaunch] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apolloService: ApolloService
    
    // Dependency injection for better testability
    init(apolloService: ApolloService = .shared) {
        self.apolloService = apolloService
        loadLaunches()
    }
    
    func loadLaunches() {
        isLoading = true
        errorMessage = nil
        
        apolloService.fetchUpcomingLaunches { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let data):
                    self?.launches = data.upcomingLaunches
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print("Error fetching launches: \(error.localizedDescription)")
                }
            }
        }
    }
}
