//
//  OTPService.swift
//
//
//  Created by mslm on 23/12/2023.
//

import Foundation

/// A class for handling OTP (One-Time Password) related services.
open class OTPService {

    /// The default instance of the `OTPService` class.
    public static let `default` = OTPService()

    /// Initializes a new instance of the `OTPService` class.
    public init() {}

    /// The underlying service responsible for handling network requests.
    private let service = Service.default

    /// Sends an OTP to the specified phone number.
    ///
    /// - Parameters:
    ///   - phoneNumer: The phone number to which the OTP will be sent.
    ///   - templateSMS: The template for the SMS containing the OTP.
    ///   - tokenLength: The length of the OTP token.
    ///   - expireSecounds: The expiration time of the OTP in seconds.
    ///   - completion: A closure to be called when the request is completed.
    ///                 It provides a `Result` object containing either the response data or an error.
    public func send(phoneNumer: String, templateSMS: String, tokenLength: Int, expireSecounds: Int, completion: @escaping ((Result<Data?, Error>) -> Void)) {
        let params = [
            "phone": phoneNumer,
            "tmpl_sms": templateSMS,
            "token_len": tokenLength,
            "expire_seconds": expireSecounds
        ] as [String: Any]

        service.request(url: Service.Router.otpSend(parameters: params, method: .post).prepareURL) { result in
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
    public func verify(phone: String, token: String, consume: Bool = true, completion: @escaping ((Result<Data?, Error>) -> Void)) {
        let params = [
            "phone": phone,
            "token": token,
            "consume": consume
        ] as [String: Any]

        service.request(url: Service.Router.otpVerify(parameters: params, method: .post).prepareURL) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
