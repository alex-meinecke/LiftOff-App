//
//  ApolloClient.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 31.03.25.
//

import Foundation
import Apollo

class ApolloService {
    static let shared = ApolloService()
    
    private(set) lazy var client: ApolloClient = {
        let url = URL(string: "http://localhost:4000/")!
        return ApolloClient(url: url)
    }()
    
    func fetchUpcomingLaunches(completion: @escaping (Result<CustomLaunchAPI.UpcomingLaunchesQuery.Data, Error>) -> Void) {
        client.fetch(query: CustomLaunchAPI.UpcomingLaunchesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    completion(.success(data))
                    print(data)
                } else if let errors = graphQLResult.errors {
                    completion(.failure(ApolloError.serverErrors(errors)))
                } else {
                    completion(.failure(ApolloError.unknownError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

enum ApolloError: Error {
    case serverErrors([GraphQLError])
    case unknownError
}
