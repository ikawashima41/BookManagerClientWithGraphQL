//
//  APIClient.swift
//  BookManagerClientWithGraphQL
//
//  Created by Iichiro Kawashima on 2020/02/26.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Apollo

protocol GithubAPIClientProtocol {
    associatedtype T
    var apollo: ApolloClient { get }
    func fetchUserFromGithub(completion: (Result<T, Error>))
}

final class GithubAPIClient {
    static let shared = GithubAPIClient()
    private init() {}

    typealias Entity = Githubv4API.ShowViewerQuery.Data?

    private lazy var networkTransport: HTTPNetworkTransport = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization": "Bearer \(Constants.githubToken)"]
        let session = URLSession(configuration: config)

        let transport = HTTPNetworkTransport(url: Constants.baseURL, session: session)
        transport.delegate = self
        return transport
    }()

    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
}

extension GithubAPIClient {
    func fetchUserFromGithub(completion: @escaping (Result<Entity, Error>) -> Void) {
        GithubAPIClient.shared.apollo.fetch(query: Githubv4API.ShowViewerQuery()) { results in
            switch results {
            case .success(let result):
              completion(.success(result.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

/// MARK: - HTTPNetworkTransportPreflightDelegate
extension GithubAPIClient: HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        /// Do something
        return true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        /// Do something
    }
}

/// MARK: - HTTPNetworkTransportTaskCompletedDelegate
extension GithubAPIClient: HTTPNetworkTransportTaskCompletedDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, didCompleteRawTaskForRequest request: URLRequest, withData data: Data?, response: URLResponse?, error: Error?) {
        /// Do something
    }

}

/// MARK: - HTTPNetworkTransportRetryDelegate
extension GithubAPIClient: HTTPNetworkTransportRetryDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, receivedError error: Error, for request: URLRequest, response: URLResponse?, retryHandler: @escaping (Bool) -> Void) {
        // Do something
    }
}
