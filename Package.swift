// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "LexickonApi",
    platforms: [
        .macOS(.v10_15),
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
    ],
    swiftLanguageVersions: [.v5]
)
