// Created 11/9/22
//

import TrafficAggregatorSDK
import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputTextField: UITextField!

    @IBAction func handleLaunchButtonTap(_ sender: Any) {
        guard
            let urlString = inputTextField.text,
            let url = URL(string: urlString)
        else { return }
        
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
    }
}
