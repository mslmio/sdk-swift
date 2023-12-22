//
//  Service+Router.swift
//
//
//  Created by mslm on 22/12/2023.
//

import Foundation

extension Service {

	/// Enumeration representing different API endpoints for the `Service` class.
	public enum Router {

		/// Endpoint for a single verification request.
		///
		/// - Parameters:
		///   - email: The email to be verified.
		///   - method: The HTTP method to be used for the request.
		case singleVerify(email: String, method: HTTPMethod)

		/// Endpoint for sending OTP (One-Time Password).
		///
		/// - Parameters:
		///   - parameters: Additional parameters for the OTP request.
		///   - method: The HTTP method to be used for the request.
		case otpSend(parameters: [String: Any], method: HTTPMethod)

		/// Endpoint for verifying OTP (One-Time Password).
		///
		/// - Parameters:
		///   - parameters: Additional parameters for the OTP verification request.
		///   - method: The HTTP method to be used for the request.
		case otpVerify(parameters: [String: Any], method: HTTPMethod)
	}
}
