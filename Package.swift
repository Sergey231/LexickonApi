// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "LexickonApi",
    platforms: [
        .macOS(.v11),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "LexickonApi", targets: ["LexickonApi"]),
    ],
    targets: [
        .target(name: "LexickonApi", dependencies: []),
        .testTarget(name: "LexickonApiTests", dependencies: ["LexickonApi"]),
    ]
)
