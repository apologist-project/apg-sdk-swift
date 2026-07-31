// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Apologist",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Apologist",
            targets: ["Apologist"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Apologist",
            path: "Sources"
        ),
        .testTarget(
            name: "ApologistTests",
            dependencies: ["Apologist"],
            path: "Tests"
        )
    ]
)
