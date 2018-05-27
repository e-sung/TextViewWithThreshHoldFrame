import UIKit
import TextViewWithThreshHoldFrame

class ViewController: UIViewController {

    @IBOutlet weak var textView: TextViewWithHeightThreshHold!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.becomeFirstResponder()
    }
}
