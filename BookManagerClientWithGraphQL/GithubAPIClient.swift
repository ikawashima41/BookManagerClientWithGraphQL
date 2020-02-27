//
//  APIClient.swift
//  BookManagerClientWithGraphQL
//
//  Created by Iichiro Kawashima on 2020/02/26.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import Foundation
import Apollo

final class GithubAPIClient {
    static let shared = GithubAPIClient()
    private init() {}

    private lazy var networkTransport: HTTPNetworkTransport = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(Constants.githubToken)"]

        let transport = HTTPNetworkTransport(url: Constants.baseURL, configration: configuration)
        transport.delegate = self
        return transport
    }()

    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
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
