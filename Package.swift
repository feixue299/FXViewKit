// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FXViewKit",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "FXViewKit",
            targets: ["FXViewKit"]),
    ],
    targets: [
        .target(
            name: "FXViewKit",
            dependencies: [],
            path: "Sources",
            sources:["Tools", "Views"])
    ]
)
