//
//  Mslm.swift
//
//
//  Created by mslm on 23/12/2023.
//

import Foundation

/// A class representing the Mslm library, providing access to OTP services and email verification.
open class Mslm {

	// MARK: Lifecycle

	/// Initializes a new instance of the `Mslm` class.
	public init(otp: OTPService = OTPService.default, emailVerify: SingleVerify = SingleVerify.default) {
		self.otp = otp
		self.emailVerify = emailVerify
	}

	// MARK: Public

	/// The OTP (One-Time Password) service for handling OTP-related functionalities.
	public let otp: OTPService

	/// The SingleVerify service for performing single email verification.
	public let emailVerify: SingleVerify

}
