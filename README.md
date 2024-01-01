# [<img src="https://avatars.githubusercontent.com/u/50307970?s=200&v=4" alt="Mslm" width="40"/>](https://mslm.io/) Official Swift client SDK for Mslm API
<p align="center">
<a href="https://github.com/mslmio/sdk-swift"><img src="https://img.shields.io/badge/build-passing-%231CB735"></a>
<a href="https://github.com/mslmio/sdk-swift"><img src="https://img.shields.io/badge/Swift-Doc-DE5C43.svg?logo=swift"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat"></a>
</p>

Swift API Client for OTP and Email Verification Services: A versatile Swift SDK designed for easy integration with OTP (One-Time Password) and Email Verification services. This SDK provides straightforward functions for sending and verifying one-time passwords via SMS, as well as validating email addresses for authenticity and deliverability.

## Getting Started

You'll need an Mslm API access token, which you can get by signing up at [https://mslm.io/signup](https://mslm.io/signup).

### Installation

#### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding mslm as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/mslmio/sdk-swift", .upToNextMajor(from: "0.1.0"))
]
```

#### Authentication

The Mslm Swift SDK can be authenticated with your Mslm API access token, which is passed with this key `MslmApiKey` in `info.plist` file. Your Mslm access token can be found in the account section of Mslm's website.

## Usage

Let's go through how to start using the Mslm Swift SDK with sample code.

### 1. Import the SDK

In your Swift file, import the library at the beginning of the file:

```swift
import Mslm
```

### 2. Initialize the SDK

Create an instance of the `Mslm` class to access the OTP and Email Verification services:

```swift
let mslm = Mslm()
```

### 3. OTP Usage

Sending OTP:

```swift
    /// - Parameters:
    ///   - phoneNumer: The phone number to which the OTP will be sent.
    ///   - templateSMS: The template for the SMS containing the OTP.
    ///   - tokenLength: The length of the OTP token.
    ///   - expireSecounds: The expiration time of the OTP in seconds.
mslm.otp.send(phoneNumer: "+123456789", templateSMS: "Your OTP is", tokenLength: 6, expireSeconds: 60) { result in
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
    /// - Parameters:
    ///   - phone: The phone number to which the OTP was sent.
    ///   - token: The OTP token to be verified.
    ///   - consume: A flag indicating whether to consume the token after verification (default is `true`).
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

### 4. Email Verification Service Usage

Single Email Verification:.

```swift
mslm.singleVerify.singleVerify("user@example.com") { result in
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

### 5. Using Only OTP or Email Verification

If you only intend to use either the OTP or Email Verification service, you can directly access the respective service instance:

OTP Service Only:

```swift
let otp = OTP.default
// Now you can use otp to send and verify OTPs

// Example function for sending OTP
otp.send(phoneNumer: "+123456789", templateSMS: "Your OTP is", tokenLength: 6, expireSeconds: 60) { result in
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

Email Service Only:

```swift
let emailVerify = EmailVerify.default
// Now you can use emailVerify for single email verification

// Example function for email verification
emailVerify.singleVerify("user@example.com") { result in
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

## About Mslm

Mslm focuses on producing world-class business solutions. It’s the bread-and-butter of our business to prioritize quality on everything we touch. Excellence is a core value that defines our culture from top to bottom.

[![image](https://avatars.githubusercontent.com/u/50307970?s=200&v=4)](https://mslm.io/)
