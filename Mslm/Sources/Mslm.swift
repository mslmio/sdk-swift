//
//  Mslm.swift
//
//
//  Created by mslm on 23/12/2023.
//

import EmailVerify
import Foundation
import OTP

/// A class representing the Mslm SDK, providing access to OTP  and email verification.
open class Mslm {

	// MARK: Lifecycle

	/// Initializes a new instance of the `Mslm` class.
	public init(otp: OTP = OTP.default, emailVerify: EmailVerify = EmailVerify.default) {
		self.otp = otp
		self.emailVerify = emailVerify
	}

	// MARK: Public

	/// The OTP (One-Time Password) service for handling OTP-related functionalities.
	public let otp: OTP

	/// The EmailVerify service for performing single email verification.
	public let emailVerify: EmailVerify

}
