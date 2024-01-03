import XCTest
@testable import Mslm

final class MslmTests: XCTestCase {
	func testEmailVerifyMslm() {
		let expectation = expectation(description: "Email Single Verify")
		let mslm = Mslm()
		mslm.emailVerify.singleVerify("support@mslm.io") { response in
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
				XCTAssertFalse(data.acceptAll ?? false)
				XCTAssertFalse(data.disposable ?? false)
				XCTAssertFalse(data.free ?? false)
				XCTAssertTrue(data.role ?? true)
				XCTAssertNotNil(data.mx)
				XCTAssertEqual(data.mx?.count, 5)
				XCTAssertEqual(data.mx?[0].host, "ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[0].pref, 1)
				XCTAssertEqual(data.mx?[1].host, "ALT1.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[1].pref, 5)
				XCTAssertEqual(data.mx?[2].host, "ALT2.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[2].pref, 5)
				XCTAssertEqual(data.mx?[3].host, "ALT3.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[3].pref, 10)
				XCTAssertEqual(data.mx?[4].host, "ALT4.ASPMX.L.GOOGLE.COM.")
				XCTAssertEqual(data.mx?[4].pref, 10)
			case .failure(let err):
				XCTFail(err.localizedDescription)
			}
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
	}
}
