import UIKit
import ApiAI
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var askButton: UIButton!
    @IBOutlet weak var questionField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func askButtonTapped(_ sender: AnyObject) {
        let request = ApiAI.shared()?.textRequest()
        if let text = self.questionField.text, text != "" {
            request?.query = text
        } else {
            return
        }
        
        request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                self.speechAndText(text: textResponse)
            }
        }, failure: { (request, error) in
            print(error!)
        })
        
        ApiAI.shared()?.enqueue(request)
        questionField.text = ""
    }
    @IBAction func editingChanged(_ textField: UITextField) {
        guard let text = textField.text else {
            askButton.isEnabled = false
            return
        }

        askButton.isEnabled = !text.isEmpty
    }

    let speechSynthesizer = AVSpeechSynthesizer()
    
    func speechAndText(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.responseLabel.text = text
        }, completion: nil)
    }
}
