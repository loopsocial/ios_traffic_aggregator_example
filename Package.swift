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
            url: "https://github.com/loopsocial/ios_traffic_aggregator_example/releases/download/v0.2.0/TrafficAggregatorSDK.zip",
            checksum: "2518bd4543c01215f84fc7010e134d5a814abe03a75806e12862a18281b8992d"
        )
    ]
)
