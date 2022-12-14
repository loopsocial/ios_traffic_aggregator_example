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
        
        do {
            let webView = try TrafficAggregatorWebViewController(url: url)
            webView.setPaymentHandler() { paymentURL, paymentComplete in
                let paymentVC = PaymentViewController(paymentURL: paymentURL, completionHandler: paymentComplete)
                webView.present(paymentVC, animated: true)
            }
            present(webView, animated: true)
        } catch {
            // Error describing why TrafficAggregatorWebViewController can't be instantiated
            debugPrint(error)
        }
    }
}
