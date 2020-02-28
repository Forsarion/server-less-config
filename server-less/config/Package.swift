// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Config",
    products: [
        .executable(name: "lambda", targets: ["lambda"]),
        .library(name: "core", targets: ["core"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tonisuter/aws-lambda-swift.git",
                 from: "0.2.0"),
    ],
    targets: [
        .target(name: "lambda", dependencies: ["core"]),
        .target(name: "core", dependencies: ["AWSLambdaSwift"]),
        .testTarget(name: "coreTests", dependencies: ["core"]),
    ]
)
