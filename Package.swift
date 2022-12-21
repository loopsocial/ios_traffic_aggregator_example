// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TrafficAggregatorSDK",
    products: [
        .library(
            name: "TrafficAggregatorSDK",
            targets: ["TrafficAggregatorSDK"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "TrafficAggregatorSDK",
            url: "https://github.com/loopsocial/ios_traffic_aggregator_example/releases/download/v0.3.0/TrafficAggregatorSDK.zip",
            checksum: "1ade1376ad8627d90d7c88a581a3cc7dc30b4f2454ad1dd9da4c4fd62f92ea8a"
        )
    ]
)
