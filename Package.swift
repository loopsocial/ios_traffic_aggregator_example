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
            url: "https://github.com/loopsocial/ios_traffic_aggregator_example/releases/download/v1.0.0-beta.1/TrafficAggregatorSDK.zip",
            checksum: "004ea36b2a1829c96fcfcd8f154911d70113cf94ecf63407000fa7643859e944"
        )
    ]
)
