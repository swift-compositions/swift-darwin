// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-darwin",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Darwin Kernel",
            targets: ["Darwin Kernel"]
        ),
        .library(
            name: "Darwin Loader",
            targets: ["Darwin Loader"]
        ),
        .library(
            name: "Darwin System",
            targets: ["Darwin System"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-standards/swift-darwin-standard.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-memory.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-system.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-random.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-error.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-path.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-clock.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-compositions/swift-posix.git", branch: "main"),
        .package(url: "https://github.com/swift-iso/swift-iso-9945.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Darwin Kernel",
            dependencies: [
                .product(name: "Darwin Kernel Standard", package: "swift-darwin-standard"),
                .product(name: "Darwin Kernel Event Standard", package: "swift-darwin-standard"),
                .product(name: "Clock", package: "swift-clock"),
                .product(name: "Error", package: "swift-error"),
                .product(name: "Memory", package: "swift-memory"),
                .product(name: "Random", package: "swift-random"),
                .product(name: "System", package: "swift-system"),
                .product(name: "Path", package: "swift-path"),

                .product(name: "POSIX Kernel", package: "swift-posix"),
                .product(name: "ISO 9945 Kernel", package: "swift-iso-9945"),
                .product(name: "ISO 9945 Core", package: "swift-iso-9945"),
                .product(name: "ISO 9945 Kernel File", package: "swift-iso-9945"),
            ]
        ),
        .target(
            name: "Darwin Loader",
            dependencies: [
                .product(name: "Darwin Loader Standard", package: "swift-darwin-standard"),
                .product(name: "POSIX Loader", package: "swift-posix"),
            ]
        ),
        .target(
            name: "Darwin System",
            dependencies: [
                .product(name: "System", package: "swift-system"),
                .product(name: "Darwin Kernel Standard", package: "swift-darwin-standard"),
            ]
        ),

        .testTarget(
            name: "Darwin Kernel Tests",
            dependencies: [
                "Darwin Kernel"
            ]
        ),
        .testTarget(
            name: "Darwin System Tests",
            dependencies: [
                "Darwin System"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
