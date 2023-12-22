//
//  Service.swift
//
//
//  Created by mslm on 22/12/2023.
//

import Foundation

/// A class that provides networking services.
open class Service {

    /// The default instance of the `Service` class.
    public static let `default` = Service()

    /// Initializes a new instance of the `Service` class.
    public init() {}

    /// Performs a network request with the given URL request.
    ///
    /// - Parameters:
    ///   - url: The URL request to be executed.
    ///   - completion: A closure to be called when the request is completed.
    ///                 It provides a `Result` object containing either the received data or an error.
    public func request(
        url: URLRequest,
        completion: @escaping ((Result<Data?, Error>) -> ())
    ) {
        let config = URLSessionConfiguration.default
        let task = URLSession(configuration: config).dataTask(with: url) { data, response, error in
            guard
                let _ = data, // is there data
                let response = response as? HTTPURLResponse, // is there HTTP response
                200..<300 ~= response.statusCode, // is statusCode 2XX
                error == nil // was there no error
            else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NetworkError.unknown))
                }
                return
            }
            completion(.success(data ?? nil))
        }
        task.resume()
    }
}
public enum NetworkError: Error {
    case unknown
    case invalidResponse
}
