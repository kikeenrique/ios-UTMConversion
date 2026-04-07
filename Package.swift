// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "UTMConversion",
    platforms: [
        .iOS(.v14), .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "UTMConversion",
            targets: ["UTMConversion"]),
    ],
    targets: [
        .target(
            name: "UTMConversion",
            dependencies: []),
        .testTarget(
            name: "UTMConversionTests",
            dependencies: ["UTMConversion"]),
    ]
)
