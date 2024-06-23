// swift-tools-version: 5.7.1
// Same as the latest version in GitHub action.
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExt",
    platforms: [
        .iOS(.v16), // This sets the minimum iOS version to 13.
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftExt",
            targets: ["SwiftExt"]),
    ],
    dependencies: [
        // Build for Local Preview Server
        // swift package --allow-writing-to-directory ./docs \
        // generate-documentation --target SwiftExt --output-path ./docs
        // swift package --disable-sandbox preview-documentation --target SwiftExt
        // Build for static-hosting
        // swift package --allow-writing-to-directory ./docs \
        // generate-documentation --target SwiftExt \
        // --output-path ./docs --transform-for-static-hosting \
        // --hosting-base-path SwiftExt --disable-indexing
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftExt",
            dependencies: [],
            path: "SwiftExt/SwiftExt"
        ),
    ]
)
