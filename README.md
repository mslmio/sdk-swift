# Mslm Swift SDK
<p align="center">
<a href="https://github.com/mslmio/sdk-swift"><img src="https://img.shields.io/badge/build-passing-%231CB735"></a>
<a href="https://github.com/mslmio/sdk-swift"><img src="https://img.shields.io/badge/Swift-Doc-DE5C43.svg?logo=swift"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat"></a>
</p>

The official Swift SDK for Mslm APIs.

## Requirements

- Xcode 14.1 (or later)
- Swift 5.2 (or later)

## Installation

See below for details about the installation method. Where
available, it's recommended to install any libraries with a `Swift` suffix to get the
best experience when writing your app in Swift.

### Swift Package Manager

Instructions for [Swift Package Manager](https://swift.org/package-manager/) support can be found in the [SwiftPackageManager.md](SwiftPackageManager.md) Markdown file.

## Authentication

The Mslm Swift SDK can be authenticated with your Mslm API access token, which is passed with this key `MslmApiKey` in `info.plist` file. Your Mslm access token can be found in the account section of Mslm's website.

## Usage

Let's go through how to start using the Mslm Swift SDK with sample code.

### Import the SDK

In your Swift file, import the library at the beginning of the file:

```swift
import Mslm
```

### Initialize the SDK

Create an instance of the `Mslm` class to use the entire Mslm SDK:

```swift
let mslm = Mslm()
```

### Using OTP

Sending OTP:

```swift
// - Parameters:
//   - phoneNumber: The phone number to which the OTP will be sent.
//   - templateSMS: The template for the SMS containing the OTP.
//   - tokenLength: The length of the OTP token.
//   - expireSeconds: The expiration time of the OTP in seconds.
mslm.otp.send(phoneNumber: "+123456789", templateSMS: "Your OTP is", tokenLength: 6, expireSeconds: 60) { result in
    switch result {
    case .success(let response):
        // Handle successful OTP sending response
        print("OTP Sent Successfully!")
    case .failure(let error):
        // Handle error
        print("Error sending OTP: \(error.localizedDescription)")
    }
}
```

Verifying OTP:

```swift
// - Parameters:
//   - phone: The phone number to which the OTP was sent.
//   - token: The OTP token to be verified.
//   - consume: A flag indicating whether to consume the token after verification (default is `true`).
mslm.otp.verify(phone: "+123456789", token: "123456") { result in
    switch result {
    case .success(let response):
        // Handle successful OTP verification response
        print("OTP Verified Successfully!")
    case .failure(let error):
        // Handle error
        print("Error verifying OTP: \(error.localizedDescription)")
    }
}
```

### Using Email Verify

```swift
mslm.emailVerify.singleVerify("user@example.com") { result in
    switch result {
    case .success(let data):
        // Handle successful email verification response
        print("Email Verified Successfully!")
    case .failure(let error):
        // Handle error
        print("Error verifying email: \(error.localizedDescription)")
    }
}
```

### Using Individual Clients

Selecting the Mslm package installs the full suite of Mslm products. If you only need specific functionalities (e.g., OTP or EmailVerify), you can choose individual products to minimize dependencies.

#### OTP

1. Import `OTP` in your swift file.

```swift
import OTP
```

2. Make a call to the OTP

```swift
// Example function for sending OTP
OTP.default.send(phoneNumber: "+123456789", templateSMS: "Your OTP is", tokenLength: 6, expireSeconds: 60) { result in
        switch result {
        case .success(let response):
            // Handle successful OTP sending response
            print("OTP sent successfully!")
        case .failure(let error):
            // Handle error
            print("Error sending OTP: \(error.localizedDescription)")
    }
}
```

#### Email Verify

1. Import `EmailVerify` in your swift file.

```swift
import EmailVerify
```

2. Make a call to the EmailVerify

```swift
// Example function for email verification
EmailVerify.default.singleVerify("user@example.com") { result in
        switch result {
        case .success(let data):
            // Handle successful email verification response
            print("Email verified successfully!")
        case .failure(let error):
            // Handle error
            print("Error verifying email: \(error.localizedDescription)")
    }
}
```

## About Mslm

Mslm focuses on producing world-class business solutions. It’s the bread-and-butter of our business to prioritize quality on everything we touch. Excellence is a core value that defines our culture from top to bottom.

[![image](https://avatars.githubusercontent.com/u/50307970?s=200&v=4)](https://mslm.io/)
