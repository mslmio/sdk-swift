//
//  HTTPMethod.swift
//
//
//  Created by mslm on 22/12/2023.
//

import Foundation

/// A struct representing HTTP methods for network requests.
public struct HTTPMethod: RawRepresentable, Equatable, Hashable {

    /// The `GET` method.
    public static let get = HTTPMethod(rawValue: "GET")

    /// The `POST` method.
    public static let post = HTTPMethod(rawValue: "POST")

    /// The raw value of the HTTP method.
    public let rawValue: String

    /// Initializes an `HTTPMethod` instance with the provided raw value.
    ///
    /// - Parameter rawValue: The raw value representing the HTTP method.
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
