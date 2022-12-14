// Created 11/9/22
// 

import UIKit
import TrafficAggregatorSDK

class PaymentViewController: UIViewController {

    @IBOutlet weak var receivedURLLabel: UILabel!
    @IBOutlet weak var successURLField: UITextField!
    @IBOutlet weak var failureURLField: UITextField!
    let paymentURLString: String
    var completionHandler: PaymentCompletionHandler


    init(paymentURL: URL, completionHandler: @escaping PaymentCompletionHandler) {
        self.completionHandler = completionHandler
        self.paymentURLString = paymentURL.absoluteString
        super.init(nibName: "PaymentViewController", bundle: .main)
    }

    required init?(coder: NSCoder) {
        completionHandler = { _ in }
        paymentURLString = ""
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        receivedURLLabel.text = paymentURLString
    }
    @IBAction func handleSendSuccessTap(_ sender: Any) {
        guard let urlString = successURLField.text, let url = URL(string: urlString) else {
            return
        }
        completionHandler(.success(url))
        self.dismiss(animated: true)
    }

    @IBAction func handleSendFailureTap(_ sender: Any) {
        guard let urlString = failureURLField.text else {
            return
        }
        completionHandler(.failure(PaymentError(underlyingError: nil, errorURL: URL(string: urlString))))
        self.dismiss(animated: true)
    }

}
