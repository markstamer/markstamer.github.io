// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PortfolioSite",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(name: "Ignite", path: "../MyIgnite")
    ],
    targets: [
        .executableTarget(
            name: "PortfolioSite",
            dependencies: ["Ignite"]),
    ]
)
