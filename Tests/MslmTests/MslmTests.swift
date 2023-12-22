import XCTest
@testable import Mslm

final class MslmTests: XCTestCase {
    func test_EmailVerify_Sv_Real() {
        let expectation = expectation(description: "Email Single Verify")

        SingleVerify.default.singleVarify("support@mslm.io") { response in
            switch response{
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data.email, "support@mslm.io")
                XCTAssertEqual(data.username, "support")
                XCTAssertEqual(data.domain, "mslm.io")
                XCTAssertFalse(data.malformed)
                XCTAssertEqual(data.suggestion, "")
                XCTAssertEqual(data.status, "real")
                XCTAssertTrue(data.hasMailbox)
                XCTAssertFalse(data.acceptAll)
                XCTAssertFalse(data.disposable)
                XCTAssertFalse(data.free)
                XCTAssertTrue(data.role)
                XCTAssertNotNil(data.mx)
                XCTAssertEqual(data.mx.count, 5)
                XCTAssertEqual(data.mx[0].host, "ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[0].pref, 1)
                XCTAssertEqual(data.mx[1].host, "ALT1.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[1].pref, 5)
                XCTAssertEqual(data.mx[2].host, "ALT2.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[2].pref, 5)
                XCTAssertEqual(data.mx[3].host, "ALT3.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[3].pref, 10)
                XCTAssertEqual(data.mx[4].host, "ALT4.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[4].pref, 10)
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func Test_EmailVerify_Sv_Fake() {
        let expectation = expectation(description: "Fake Email Single Verify")

        SingleVerify.default.singleVarify("fakefakefake@mslm.io") { response in
            switch response{
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data.email, "fakefakefake@mslm.io")
                XCTAssertEqual(data.username, "fakefakefake")
                XCTAssertEqual(data.domain, "mslm.io")
                XCTAssertFalse(data.malformed)
                XCTAssertEqual(data.suggestion, "")
                XCTAssertEqual(data.status, "fake")
                XCTAssertFalse(data.hasMailbox)
                XCTAssertFalse(data.acceptAll)
                XCTAssertFalse(data.disposable)
                XCTAssertFalse(data.free)
                XCTAssertFalse(data.role)
                XCTAssertNotNil(data.mx)
                XCTAssertEqual(data.mx.count, 5)
                XCTAssertEqual(data.mx[0].host, "ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[0].pref, 1)
                XCTAssertEqual(data.mx[1].host, "ALT1.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[1].pref, 5)
                XCTAssertEqual(data.mx[2].host, "ALT2.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[2].pref, 5)
                XCTAssertEqual(data.mx[3].host, "ALT3.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[3].pref, 10)
                XCTAssertEqual(data.mx[4].host, "ALT4.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[4].pref, 10)
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func Test_EmailVerify_Sv_Disposable() {
        let expectation = expectation(description: "Disposable Email Single Verify")

        SingleVerify.default.singleVarify("asdfasdf@temp-mail.org") { response in
            switch response{
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data.email, "asdfasdf@temp-mail.org")
                XCTAssertEqual(data.username, "asdfasdf")
                XCTAssertEqual(data.domain, "temp-mail.org")
                XCTAssertFalse(data.malformed)
                XCTAssertEqual(data.suggestion, "")
                XCTAssertEqual(data.status, "real")
                XCTAssertTrue(data.hasMailbox)
                XCTAssertTrue(data.acceptAll)
                XCTAssertTrue(data.disposable)
                XCTAssertTrue(data.free)
                XCTAssertFalse(data.role)
                XCTAssertNotNil(data.mx)
                XCTAssertEqual(data.mx.count, 1)
                XCTAssertEqual(data.mx[0].host, "mx.yandex.net.")
                XCTAssertEqual(data.mx[0].pref, 10)
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func Test_EmailVerify_Sv_Malformed() {
        let expectation = expectation(description: "Malformed Email Single Verify")

        SingleVerify.default.singleVarify("malformedemail") { response in
            switch response{
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data.email, "malformedemail")
                XCTAssertEqual(data.username, "")
                XCTAssertEqual(data.domain, "")
                XCTAssertTrue(data.malformed)
                XCTAssertEqual(data.suggestion, "")
                XCTAssertEqual(data.status, "fake")
                XCTAssertFalse(data.hasMailbox)
                XCTAssertFalse(data.acceptAll)
                XCTAssertFalse(data.disposable)
                XCTAssertFalse(data.free)
                XCTAssertFalse(data.role)
                XCTAssertNil(data.mx)
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func SendOTP() {
        let expectation = expectation(description: "Send OTP")
        OTPService.default.send(phoneNumer: "", templateSMS: "Your OTP is", tokenLength: 6, expireSecounds: 60) { result in
            switch result{
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
        OTPService.default.verify(phone: "", token: "") { result in
            switch result{
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testWithMSLM() {
        let expectation = expectation(description: "Email Single Verify")
        let mslm = Mslm()
        mslm.emailVerify.singleVarify("support@mslm.io") { response in
            switch response{
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data.email, "support@mslm.io")
                XCTAssertEqual(data.username, "support")
                XCTAssertEqual(data.domain, "mslm.io")
                XCTAssertFalse(data.malformed)
                XCTAssertEqual(data.suggestion, "")
                XCTAssertEqual(data.status, "real")
                XCTAssertTrue(data.hasMailbox)
                XCTAssertFalse(data.acceptAll)
                XCTAssertFalse(data.disposable)
                XCTAssertFalse(data.free)
                XCTAssertTrue(data.role)
                XCTAssertNotNil(data.mx)
                XCTAssertEqual(data.mx.count, 5)
                XCTAssertEqual(data.mx[0].host, "ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[0].pref, 1)
                XCTAssertEqual(data.mx[1].host, "ALT1.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[1].pref, 5)
                XCTAssertEqual(data.mx[2].host, "ALT2.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[2].pref, 5)
                XCTAssertEqual(data.mx[3].host, "ALT3.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[3].pref, 10)
                XCTAssertEqual(data.mx[4].host, "ALT4.ASPMX.L.GOOGLE.COM.")
                XCTAssertEqual(data.mx[4].pref, 10)
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
