//
//  Constant.swift
//
//
//  Created by mslm on 22/12/2023.
//

import Foundation

/// A struct containing constant values used throughout the application.
enum Constant {

	/// The base URL of the server.
	static let SERVER_URL = "https://mslm.io"

	/// The user agent string for API requests.
	static let USER_AGENT = "mslm/swift/0.0.1"

	/// The content type for API requests.
	static let CONTENT_TYPE = "application/json"

	/// The endpoint for single email verification API.
	static let SINGLE_VERIFY_ENDPOINT = "/api/sv/v1"

	/// The endpoint for sending OTP (One-Time Password) API.
	static let OTP_SEND_ENDPOINT = "/api/otp/v1/send"

	/// The endpoint for verifying OTP (One-Time Password) API.
	static let OTP_VERIFY_ENDPOINT = "/api/otp/v1/token_verify"

	/// Computed property to get the API key from the app's Bundle.
	static var API_KEY: String {
		guard let apiKey = Bundle.main.apiKey, !apiKey.isEmpty else {
			fatalError("API key is missing or empty. Please provide a valid API key.")
		}
		return "apikey=\(apiKey)"
	}

	/// Computed property to get the application version from the app's Bundle.
	static var APP_VERSION: String {
		Bundle.main.appVersion ?? ""
	}

	/// Computed property to get the application name from the app's Bundle.
	static var APP_NAME: String {
		Bundle.main.appName ?? ""
	}
}
