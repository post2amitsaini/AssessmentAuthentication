// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AssessmentAuthentication",
    platforms: [
            .iOS(.v16)    
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AssessmentAuthentication",
            targets: ["AssessmentAuthentication"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "9.0.0"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AssessmentAuthentication",
            dependencies: [
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "Swinject", package: "Swinject")
            ],
            resources: [.copy("GoogleService-Info.plist")]),
        .testTarget(
            name: "AssessmentAuthenticationTests",
            dependencies: ["AssessmentAuthentication"]),
    ]
)
