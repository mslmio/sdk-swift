// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Mslm",
	platforms: [.iOS(.v12), .macCatalyst(.v13), .macOS(.v10_13), .tvOS(.v12), .watchOS(.v7)],
	products: [
		// Products define the executables and libraries a package produces, making them visible to other packages.
		.library(
			name: "Mslm",
			targets: ["Mslm"]),
		.library(
			name: "OTP",
			targets: ["OTP"]),
		.library(
			name: "EmailVerify",
			targets: ["EmailVerify"]),
	],
	targets: [

		// Main SDK target

		.target(
			name: "Mslm",
			dependencies: ["OTP", "EmailVerify"],
			path: "Mslm/Sources"),
		.testTarget(
			name: "MslmTests",
			dependencies: ["Mslm"],
			path: "Mslm/Tests"),

		// OTP SDK target

		.target(
			name: "OTP",
			dependencies: ["MslmNetworkManager"],
			path: "OTP/Sources"),
		.testTarget(
			name: "OTPTests",
			dependencies: ["OTP"],
			path: "OTP/Tests"),

		// EmailVerify SDK target

		.target(
			name: "EmailVerify",
			dependencies: ["MslmNetworkManager"],
			path: "EmailVerify/Sources"),
		.testTarget(
			name: "EmailVerifyTests",
			dependencies: ["EmailVerify"],
			path: "EmailVerify/Tests"),

		// MslmNetworkManager

		.target(
			name: "MslmNetworkManager",
			dependencies: [],
			path: "MslmNetworkManager"),
	])
