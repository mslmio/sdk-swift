//
//  SingleVerifyResp.swift
//
//
//  Created by mslm on 22/12/2023.
//

import Foundation

// MARK: - SingleVerifyResp

/// A struct representing the response of a single email verification API request.
public struct SingleVerifyResp: Codable {

	// MARK: Lifecycle

	/// Initializes a `SingleVerifyResp` instance with the provided values.
	///
	/// - Parameters:
	///   - email: The email address.
	///   - username: The username associated with the email address.
	///   - domain: The domain of the email address.
	///   - malformed: Indicates if the email address is malformed.
	///   - suggestion: A suggestion for a corrected email address.
	///   - status: The verification status of the email address.
	///   - hasMailbox: Indicates if the email address has a mailbox.
	///   - acceptAll: Indicates if the email address accepts all emails.
	///   - disposable: Indicates if the email address is disposable.
	///   - free: Indicates if the email address is free.
	///   - role: Indicates if the email address is a role-based address.
	///   - mx: An array of mail exchange (MX) records associated with the email domain.
	public init(
		email: String,
		username: String,
		domain: String,
		malformed: Bool,
		suggestion: String,
		status: String,
		hasMailbox: Bool,
		acceptAll: Bool,
		disposable: Bool,
		free: Bool,
		role: Bool,
		mx: [MX]) {
		self.email = email
		self.username = username
		self.domain = domain
		self.malformed = malformed
		self.suggestion = suggestion
		self.status = status
		self.hasMailbox = hasMailbox
		self.acceptAll = acceptAll
		self.disposable = disposable
		self.free = free
		self.role = role
		self.mx = mx
	}

	// MARK: Public

	/// The email address that was verified.
	public let email: String

	/// The username associated with the email address.
	public let username: String

	/// The domain of the email address.
	public let domain: String

	/// Indicates if the email address is malformed.
	public let malformed: Bool

	/// A suggestion for a corrected email address.
	public let suggestion: String

	/// The verification status of the email address.
	public let status: String

	/// Indicates if the email address has a mailbox.
	public let hasMailbox: Bool

	/// Indicates if the email address accepts all emails.
	public let acceptAll: Bool

	/// Indicates if the email address is disposable.
	public let disposable: Bool

	/// Indicates if the email address is free.
	public let free: Bool

	/// Indicates if the email address is a role-based address.
	public let role: Bool

	/// An array of mail exchange (MX) records associated with the email domain.
	public let mx: [MX]

	// MARK: Internal

	/// Coding keys for mapping between Swift and JSON keys.
	enum CodingKeys: String, CodingKey {
		case email
		case username
		case domain
		case malformed
		case suggestion
		case status
		case hasMailbox = "has_mailbox"
		case acceptAll = "accept_all"
		case disposable
		case free
		case role
		case mx
	}

}

// MARK: - MX

/// A struct representing a mail exchange (MX) record.
public struct MX: Codable {

	// MARK: Lifecycle

	/// Initializes an `MX` instance with the provided values.
	///
	/// - Parameters:
	///   - host: The host associated with the MX record.
	///   - pref: The preference value of the MX record.
	public init(host: String, pref: Int) {
		self.host = host
		self.pref = pref
	}

	// MARK: Public

	/// The host associated with the MX record.
	public let host: String

	/// The preference value of the MX record.
	public let pref: Int

	// MARK: Internal

	/// Coding keys for mapping between Swift and JSON keys.
	enum CodingKeys: String, CodingKey {
		case host
		case pref
	}

}
