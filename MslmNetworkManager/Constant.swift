//
//  Constant.swift
//
//
//  Created by mslm on 22/12/2023.
//

import Foundation

/// A struct containing constant values used throughout the application.
public enum Constant {

	/// The base URL of the server.
	public static let SERVER_URL = "https://mslm.io"

	/// The user agent string for API requests.
	public static let USER_AGENT = "mslm/swift/0.0.1"

	/// The content type for API requests.
	public static let CONTENT_TYPE = "application/json"

	/// Computed property to get the API key from the app's Bundle.
	public static var API_KEY: String {
		guard let apiKey = Bundle.main.apiKey, !apiKey.isEmpty else {
			fatalError("API key is missing or empty. Please provide a valid API key.")
		}
		return "apikey=\(apiKey)"
	}
}
