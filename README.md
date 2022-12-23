# Traffic Aggregator SDK

## About

TrafficAggregatorSDK is a library to help facilitate communications between apps that can process payments on behalf of a the underlying player.

## Setup Prerequisites

To integrate TrafficAggregatorSDK into your application, you have to register your application with Firework platform and get unique OAuth app ID. To get the app ID:

- Provide your application's bundle identifier or package name to the business team / engineering team you are co-ordinating with.

The app ID is used to authenticate your application with the server. Authentication will fail if you use wrong app ID.

## Requirements

TrafficAggregatorSDK is compatible with:

  - iOS 11 or greater.
  - Xcode 13+ or greater.
  - Swift 5.3 or greater.

## How to add TrafficAggregatorSDK to your Xcode project?

TrafficAggregatorSDK can be imported manually as an `xcframework`.

### Importing FireworkVideo Framework Manually

* Drag the unzipped `TrafficAggregatorSDK.xcframework` into the Xcode project navigator and drop it at root of your project. Make sure `Copy items if needed` checkbox is selected in the confirmation dialog. Check to make sure your project directory now has `TrafficAggregatorSDK.xcframework` in it and it is visible and linked in your Xcode project navigator.

* In your apps Project pane select your app Target > General > Frameworks, Libraries and Embedded Content, find `TrafficAggregatorSDK.xcframework` and select `Embed and Sign`.

### Firework IDs

Include the app ID in your app `Info.plist` file using the key `FireworkAppID` see image below. If the app ID is not included or is included under a differently spelled key, the SDK will return an error. See Troubleshooting for more details.

### How To Use

#### Initialization

Before using any components video components are used you must initialize `TrafficAggregatorSDK`.

Start by importing the SDK into your App Delegate. Then initialize the TrafficAggregatorSDK in the App Delegate method `application(:, didFinishLaunchingWithOptions:) -> Bool`.

```swift
import UIKit

// Add the dependency SDK
import TrafficAggregatorSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        // Initialize TrafficAggregator SDK at the beginning of the app's life cycle
        do {
            try TrafficAggregatorSDK.initialize()
        } catch {
            // Error describing why TrafficAggregatorWebViewController can't be initialized
            debugPrint(error)
        }
        
        return true
    }
    
    // ... // 
}
```

#### Displaying Traffic Aggregator Web View

There are is minimum setup before displaying the `TrafficAggregatorWebViewController`.

```swift

    // 1. Create a new TrafficAggregatorWebViewController with the traffic aggregator url.
    let webView = TrafficAggregatorWebViewController(url: url)
    
    // 2. Add a payment handler. This will provide 2 way communication between the web view and your app. 
    webView.paymentHandler = { [weak webView] paymentURL, paymentComplete in
        let paymentVC = PaymentViewController(paymentURL: paymentURL, completionHandler: paymentComplete)
        webView?.present(paymentVC, animated: true)
    }
    
    // 2.1 (Optional). If you are interested in error describing why TrafficAggregatorWebViewController can't be instantiated.
    webView.onError = { error in
        debugPrint(error)
    }

    // 3. Present the web view controller
    present(webView, animated: true)
```
