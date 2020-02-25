// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "config",
    products: [
        .library(
            name: "config",
            targets: ["config"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tonisuter/aws-lambda-swift.git",
                 from: "0.2.0"),
    ],
    targets: [
        .target(
            name: "config",
            dependencies: ["AWSLambdaSwift"]),
        .testTarget(
            name: "configTests",
            dependencies: ["config", "AWSLambdaSwift"]),
    ]
)
