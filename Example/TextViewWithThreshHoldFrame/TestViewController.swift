import UIKit
import TextViewWithThreshHoldFrame

public class TestViewController: UIViewController {

    @IBOutlet public weak var textView: TextViewWithHeightThreshHold!
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textView.becomeFirstResponder()
    }
}
