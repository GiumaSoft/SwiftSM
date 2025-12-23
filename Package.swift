// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

@preconcurrency import PackageDescription

let package = Package(
  name: "SwiftSM",
  platforms: [
    .iOS(.v18),
    .macOS(.v15)
  ],
  products: [
    .library(
        name: "SwiftSM",
        targets: ["SwiftSM"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-collections.git", from: "1.3.0")
  ],
  targets: [
    .target(
        name: "SwiftSM",
        dependencies: [
            .product(name: "Collections", package: "swift-collections")
        ],
        path: "Sources",
        swiftSettings: [
          .define("DEBUG", .when(configuration: .debug))
        ]
    ),
    .testTarget(
        name: "SwiftSMTests",
        dependencies: ["SwiftSM"],
        path: "Tests"
    )
  ],
  swiftLanguageModes: [.version("6")]
)
