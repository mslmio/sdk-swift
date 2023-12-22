//
//  SingleVerify.swift
//
//
//  Created by mslm on 23/12/2023.
//

import Foundation

/// A class for performing single email verification using the provided API.
open class SingleVerify {

	// MARK: Lifecycle

	/// Initializes a new instance of the `SingleVerify` class.
	public init() { }

	// MARK: Public

	/// The default instance of the `SingleVerify` class.
	public static let `default` = SingleVerify()

	/// Performs a single email verification with the provided email address.
	///
	/// - Parameters:
	///   - email: The email address to be verified.
	///   - completion: A closure to be called when the verification is completed.
	///                 It provides a `Result` object containing either the verification response or an error.
	public func singleVarify(_ email: String, completion: @escaping ((Result<SingleVerifyResp, Error>) -> Void)) {
		service.request(url: Service.Router.singleVerify(email: email, method: .get).prepareURL) { response in
			switch response {
			case .success(let data):
				do {
					let response = try JSONDecoder().decode(SingleVerifyResp.self, from: data ?? Data())
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
	private var service = Service.default

}
