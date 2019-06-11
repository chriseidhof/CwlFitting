// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "CwlFitting",
	platforms: [
		.macOS(.v10_15), .iOS(.v13),
	],
	products: [
		.library(
			name: "CwlFitting",
			targets: ["CwlFitting"]),
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "CwlFitting",
			dependencies: []),
		.testTarget(
			name: "CwlFittingTests",
			dependencies: ["CwlFitting"]),
	]
)
