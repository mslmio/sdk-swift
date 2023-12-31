//
//  File.swift
//
//
//  Created by mslm on 01/01/2024.
//

import Foundation
import MslmNetworkManager

extension OTP.Router {

	// MARK: Public

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

	/// The endpoint for sending OTP (One-Time Password) API.
	private static let OTP_SEND_ENDPOINT = "/api/otp/v1/send"

	/// The endpoint for verifying OTP (One-Time Password) API.
	private static let OTP_VERIFY_ENDPOINT = "/api/otp/v1/token_verify"

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
		case .otpSend(let params, let method):
			configureOTPSendParameters(&request, parameters: params, method: method)
		case .otpVerify(let params, let method):
			configureOTPVerifyParameters(&request, parameters: params, method: method)
		}
	}

	/// Configures URL parameters for OTP send request.
	private func configureOTPSendParameters(_ request: inout URLRequest, parameters: [String: Any], method: HTTPMethod) {
		// Construct the URL for OTP send request
		let url = baseURL.appendingPathComponent(OTP.Router.OTP_SEND_ENDPOINT)
		var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
		components?.queryItems = [URLQueryItem(name: "apikey", value: Constant.API_KEY)]

		guard let finalURL = components?.url else {
			fatalError("Failed to construct URL for single email verification")
		}

		request.url = finalURL
		request.httpMethod = method.rawValue

		// Serialize parameters to JSON and set as HTTP body
		guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
			return
		}
		request.httpBody = httpBody
	}

	/// Configures URL parameters for OTP verification request.
	private func configureOTPVerifyParameters(_ request: inout URLRequest, parameters: [String: Any], method: HTTPMethod) {
		// Construct the URL for OTP verification request
		let url = baseURL.appendingPathComponent(OTP.Router.OTP_VERIFY_ENDPOINT)
		var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
		components?.queryItems = [URLQueryItem(name: "apikey", value: Constant.API_KEY)]

		guard let finalURL = components?.url else {
			fatalError("Failed to construct URL for single email verification")
		}

		request.url = finalURL
		request.httpMethod = method.rawValue

		// Serialize parameters to JSON and set as HTTP body
		guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
			return
		}
		request.httpBody = httpBody
	}
}
