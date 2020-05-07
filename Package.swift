// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ALExtensions",
    products: [
        .library(
            name: "AL-Extensions",
            targets: ["AL-Extensions"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "AL-Extensions",
            dependencies: []),
        .testTarget(
            name: "AL-ExtensionsTests",
            dependencies: ["AL-Extensions"]),
    ]
)
