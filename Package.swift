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
            url: "https://github.com/loopsocial/ios_traffic_aggregator_example/releases/download/v1.0.0-beta.3/TrafficAggregatorSDK.zip",
            checksum: "5ea2027bbf353ea759e7d5c9fc9c13f53a1cf6dc4d01b261697fac0a08118139"
        )
    ]
)
