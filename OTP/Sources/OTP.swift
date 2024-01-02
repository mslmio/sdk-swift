//
//  OTP.swift
//
//
//  Created by mslm on 23/12/2023.
//

import Foundation
import MslmNetworkManager

/// A class for handling OTP (One-Time Password) related services.
open class OTP {

	// MARK: Lifecycle

	/// Initializes a new instance of the `OTP` class.
	public init() { }

	// MARK: Public

	/// The default instance of the `OTP` class.
	public static let `default` = OTP()

	/// Sends an OTP to the specified phone number.
	///
	/// - Parameters:
	///   - phoneNumber: The phone number to which the OTP will be sent.
	///   - templateSMS: The template for the SMS containing the OTP.
	///   - tokenLength: The length of the OTP token.
	///   - expireSeconds: The expiration time of the OTP in seconds.
	///   - completion: A closure to be called when the request is completed.
	///                 It provides a `Result` object containing either the response data or an error.
	public func send(
		phoneNumber: String,
		templateSMS: String,
		tokenLength: Int,
		expireSeconds: Int,
		completion: @escaping ((Result<Data?, Error>) -> Void)) {
		let params = [
			"phone": phoneNumber,
			"tmpl_sms": templateSMS,
			"token_len": tokenLength,
			"expire_seconds": expireSeconds,
		] as [String: Any]

		networkManager.request(url: OTP.Router.otpSend(parameters: params, method: .post).prepareURL) { result in
			switch result {
			case .success(let response):
				completion(.success(response))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

	/// Verifies the OTP sent to the specified phone number.
	///
	/// - Parameters:
	///   - phone: The phone number to which the OTP was sent.
	///   - token: The OTP token to be verified.
	///   - consume: A flag indicating whether to consume the token after verification (default is `true`).
	///   - completion: A closure to be called when the verification is completed.
	///                 It provides a `Result` object containing either the response data or an error.
	public func verify(
		phone: String,
		token: String,
		consume: Bool = true,
		completion: @escaping ((Result<Data?, Error>) -> Void)) {
		let params = [
			"phone": phone,
			"token": token,
			"consume": consume,
		] as [String: Any]

		networkManager.request(url: OTP.Router.otpVerify(parameters: params, method: .post).prepareURL) { result in
			switch result {
			case .success(let response):
				completion(.success(response))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

	// MARK: Private

	/// The underlying service responsible for handling network requests.
	private let networkManager = MslmNetworkManager.default

}
