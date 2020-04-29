// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ranmoji",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMinor(from: "0.0.4")),
        .package(url: "https://github.com/apple/swift-tools-support-core", .upToNextMinor(from: "0.1.1")),
    ],
    targets: [
        .target(
            name: "ranmoji",
            dependencies: [
                "RanmojiKit",
        ]),
        .target(
            name: "RanmojiKit",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core")
            ]
        ),
        .testTarget(
            name: "RanmojiKitTests",
            dependencies: ["RanmojiKit"]),
    ]
)
