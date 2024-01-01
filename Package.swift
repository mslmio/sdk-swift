// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Mslm",
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
			dependencies: ["OTP", "EmailVerify"]),
		// OTP SDK target
		.target(
			name: "OTP",
			dependencies: ["MslmNetworkManager"]),
		// EmailVerify SDK target
		.target(
			name: "EmailVerify",
			dependencies: ["MslmNetworkManager"]),
		.target(
			name: "MslmNetworkManager",
			dependencies: []),
		.testTarget(
			name: "MslmTests",
			dependencies: ["Mslm"]),
	])
