//
//  OTPTests.swift
//
//
//  Created by mslm on 01/01/2024.
//

import XCTest
@testable import OTP

final class EmailVerifyTests: XCTestCase {
	func SendOTP() {
		let expectation = expectation(description: "Send OTP")
		OTP.default.send(phoneNumber: "", templateSMS: "Your OTP is", tokenLength: 6, expireSeconds: 60) { result in
			switch result {
			case .success(let response):
				XCTAssertNotNil(response)
			case .failure(let err):
				XCTFail(err.localizedDescription)
			}
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
	}

	func VerifyOTP() {
		let expectation = expectation(description: "Verify OTP")
		OTP.default.verify(phone: "", token: "") { result in
			switch result {
			case .success(let response):
				XCTAssertNotNil(response)
			case .failure(let err):
				XCTFail(err.localizedDescription)
			}
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
	}
}
