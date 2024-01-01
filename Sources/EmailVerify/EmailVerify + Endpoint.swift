//
//  File.swift
//  
//
//  Created by mslm on 01/01/2024.
//

import Foundation
import MslmNetworkManager

extension EmailVerify.Router{

    /// The endpoint for single email verification API.
    private static let SINGLE_VERIFY_ENDPOINT = "/api/sv/v1"

    /// Constructs and returns a URLRequest based on the router type.
    public var prepareURL: URLRequest {
        // Step 1: Construct the base URL
        var request = URLRequest(url: baseURL)

        // Step 2: Configure common headers for the request
        configureCommonHeaders(&request)

        // Step 3: Configure URL parameters based on the router type
        configureURLParameters(&request)

        return request
    }

    // MARK: Private

    // MARK: - Private Helper Functions

    /// Constructs the base URL for the request.
    private var baseURL: URL {
        guard let url = URL(string: Constant.SERVER_URL) else {
            fatalError("Invalid base URL")
        }
        return url
    }

    /// Configures common headers for the request (e.g., user-agent, content-type).
    private func configureCommonHeaders(_ request: inout URLRequest) {
        request.addValue(Constant.USER_AGENT, forHTTPHeaderField: "user-agent")
        request.addValue(Constant.CONTENT_TYPE, forHTTPHeaderField: "content-type")
    }

    /// Configures URL parameters based on the router type.
    private func configureURLParameters(_ request: inout URLRequest) {
        switch self {
        case .singleVerify(let email, let method):
            configureEmailVerifyParameters(&request, email: email, method: method)
        }
    }

    /// Configures URL parameters for single email verification.
    private func configureEmailVerifyParameters(_ request: inout URLRequest, email: String, method: HTTPMethod) {
        // Construct the URL for single email verification
        let url = baseURL.appendingPathComponent(EmailVerify.Router.SINGLE_VERIFY_ENDPOINT)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "email", value: email),
            URLQueryItem(name: "apikey", value: Constant.API_KEY),
        ]

        guard let finalURL = components?.url else {
            fatalError("Failed to construct URL for single email verification")
        }

        request.url = finalURL
        request.httpMethod = method.rawValue
    }
}
