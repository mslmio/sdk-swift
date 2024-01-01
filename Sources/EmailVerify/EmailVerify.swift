//
//  EmailVerify.swift
//
//
//  Created by mslm on 23/12/2023.
//

import Foundation
import MslmNetworkManager

/// A class for performing single email verification using the provided API.
open class EmailVerify {

	// MARK: Lifecycle

	/// Initializes a new instance of the `EmailVerify` class.
	public init() { }

	// MARK: Public

	/// The default instance of the `EmailVerify` class.
	public static let `default` = EmailVerify()

	/// Performs a single email verification with the provided email address.
	///
	/// - Parameters:
	///   - email: The email address to be verified.
	///   - completion: A closure to be called when the verification is completed.
	///                 It provides a `Result` object containing either the verification response or an error.
	public func singleVerify(_ email: String, completion: @escaping ((Result<EmailVerifyResp, Error>) -> Void)) {
        networkManager.request(url: EmailVerify.Router.singleVerify(email: email, method: .post).prepareURL) { response in
			switch response {
			case .success(let data):
				do {
					let response = try JSONDecoder().decode(EmailVerifyResp.self, from: data ?? Data())
					completion(.success(response))
				} catch let error {
					completion(.failure(error))
				}
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

	// MARK: Private

	/// The underlying service responsible for handling network requests.
	private var networkManager = MslmNetworkManager.default

}
