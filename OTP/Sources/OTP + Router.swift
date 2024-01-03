//
//  File.swift
//
//
//  Created by mslm on 01/01/2024.
//

import Foundation
import MslmNetworkManager
extension OTP {
	public enum Router {

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
