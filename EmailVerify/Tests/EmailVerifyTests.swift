//
//  EmailVerifyTests.swift
//
//
//  Created by mslm on 01/01/2024.
//

import XCTest
@testable import EmailVerify

final class EmailVerifyTests: XCTestCase {
	func test_EmailVerify_Sv_Real() {
		let expectation = expectation(description: "Email Single Verify")

		EmailVerify.default.singleVerify("support@mslm.io") { response in
			switch response {
			case .success(let data):
				XCTAssertNotNil(data)
				XCTAssertEqual(data.email, "support@mslm.io")
				XCTAssertEqual(data.username, "support")
				XCTAssertEqual(data.domain, "mslm.io")
				XCTAssertFalse(data.malformed ?? true)
				XCTAssertEqual(data.suggestion, "")
				XCTAssertEqual(data.status, "real")
				XCTAssertTrue(data.hasMailbox ?? false)
				XCTAssertFalse(data.acceptAll ?? true)
				XCTAssertFalse(data.disposable ?? true)
				XCTAssertFalse(data.free ?? true)
				XCTAssertTrue(data.role ?? false)
				XCTAssertNotNil(data.mx)
				XCTAssertEqual(data.mx?.count, 5)
				XCTAssertEqual(data.mx?[0].host, "ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[0].pref, 1)
				XCTAssertEqual(data.mx?[1].host, "ALT1.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[1].pref, 5)
				XCTAssertEqual(data.mx?[2].host, "ALT2.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[2].pref, 5)
				XCTAssertEqual(data.mx?[3].host ?? "", "ALT4.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[3].pref, 10)
				XCTAssertEqual(data.mx?[4].host ?? "", "ALT3.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[4].pref, 10)
			case .failure(let err):
				XCTFail(err.localizedDescription)
			}
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
	}

	func test_EmailVerify_Sv_Fake() {
		let expectation = expectation(description: "Fake Email Single Verify")

		EmailVerify.default.singleVerify("fakefakefake@mslm.io") { response in
			switch response {
			case .success(let data):
				XCTAssertNotNil(data)
				XCTAssertEqual(data.email, "fakefakefake@mslm.io")
				XCTAssertEqual(data.username, "fakefakefake")
				XCTAssertEqual(data.domain, "mslm.io")
				XCTAssertFalse(data.malformed ?? true)
				XCTAssertEqual(data.suggestion, "")
				XCTAssertEqual(data.status, "fake")
				XCTAssertFalse(data.hasMailbox ?? true)
				XCTAssertFalse(data.acceptAll ?? true)
				XCTAssertFalse(data.disposable ?? true)
				XCTAssertFalse(data.free ?? true)
				XCTAssertFalse(data.role ?? true)
				XCTAssertNotNil(data.mx)
				XCTAssertEqual(data.mx?.count, 5)
				XCTAssertEqual(data.mx?[0].host, "ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[0].pref, 1)
				XCTAssertEqual(data.mx?[1].host, "ALT1.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[1].pref, 5)
				XCTAssertEqual(data.mx?[2].host, "ALT2.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[2].pref, 5)
				XCTAssertEqual(data.mx?[3].host, "ALT4.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[3].pref, 10)
				XCTAssertEqual(data.mx?[4].host, "ALT3.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[4].pref, 10)
			case .failure(let err):
				XCTFail(err.localizedDescription)
			}
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
	}

	func test_EmailVerify_Sv_Disposable() {
		let expectation = expectation(description: "Disposable Email Single Verify")

		EmailVerify.default.singleVerify("asdfasdf@temp-mail.org") { response in
			switch response {
			case .success(let data):
				XCTAssertNotNil(data)
				XCTAssertEqual(data.email, "asdfasdf@temp-mail.org")
				XCTAssertEqual(data.username, "asdfasdf")
				XCTAssertEqual(data.domain, "temp-mail.org")
				XCTAssertFalse(data.malformed ?? true)
				XCTAssertEqual(data.suggestion, "")
				XCTAssertEqual(data.status, "disposable")
				XCTAssertTrue(data.hasMailbox ?? false)
				XCTAssertTrue(data.acceptAll ?? false)
				XCTAssertTrue(data.disposable ?? false)
				XCTAssertTrue(data.free ?? false)
				XCTAssertFalse(data.role ?? true)
				XCTAssertNotNil(data.mx)
				XCTAssertEqual(data.mx?.count, 1)
				XCTAssertEqual(data.mx?[0].host, "mx.yandex.net.")
				XCTAssertEqual(data.mx?[0].pref, 10)
			case .failure(let err):
				XCTFail(err.localizedDescription)
			}
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
	}

	func test_EmailVerify_Sv_Malformed() {
		let expectation = expectation(description: "Malformed Email Single Verify")

		EmailVerify.default.singleVerify("malformedemail") { response in
			switch response {
			case .success(let data):
				XCTAssertNotNil(data)
				XCTAssertEqual(data.email, "malformedemail")
				XCTAssertEqual(data.username, "")
				XCTAssertEqual(data.domain, "")
				XCTAssertTrue(data.malformed ?? false)
				XCTAssertEqual(data.suggestion, "")
				XCTAssertEqual(data.status, "fake")
				XCTAssertFalse(data.hasMailbox ?? true)
				XCTAssertFalse(data.acceptAll ?? true)
				XCTAssertFalse(data.disposable ?? true)
				XCTAssertFalse(data.free ?? true)
				XCTAssertFalse(data.role ?? true)
                XCTAssertEqual(data.mx?.count ?? 0, 0)
			case .failure(let err):
				XCTFail(err.localizedDescription)
			}
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
	}
}
