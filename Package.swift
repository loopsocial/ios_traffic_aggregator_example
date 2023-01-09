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
            url: "https://github.com/loopsocial/ios_traffic_aggregator_example/releases/download/v1.0.0-beta.2/TrafficAggregatorSDK.zip",
            checksum: "0493bda9fe49ea5e305c2e87cc93434cdf67765e2ce7a5274a8b95a6d293d553"
        )
    ]
)
