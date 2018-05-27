import UIKit

@IBDesignable
open class TextViewWithHeightThreshHold: UITextView {
    
    /// Default = 100
    private let defaultThreshHold: CGFloat = 100
    @IBInspectable public var heightThreshHold: CGFloat = 100
    public var isHeightThreshHoldActive : Bool {
        get { return threshHoldConstraint.isActive }
        set { threshHoldConstraint.isActive = newValue }
    }
    internal var lastCharCount = 0
    internal var initialHeight: CGFloat = 33
    internal var textViewHeightConstraint: NSLayoutConstraint!
    internal var threshHoldConstraint: NSLayoutConstraint!
    open override var text: String! {
        didSet { lastCharCount = oldValue.count }
    }
    
    internal var isIncreasing: Bool {
        return self.text.count > lastCharCount
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        setUpInitialValues()
        setUpConstraints()
        delegate = self
    }

    internal func setUpInitialValues() {
        heightThreshHold = defaultThreshHold
        isScrollEnabled = false
        initialHeight = frame.size.height
    }
    
    internal func setUpConstraints() {
        threshHoldConstraint = heightAnchor.constraint(lessThanOrEqualToConstant: heightThreshHold)
        threshHoldConstraint.isActive = true
        
        textViewHeightConstraint = heightAnchor.constraint(equalToConstant: contentSize.height)
        textViewHeightConstraint.isActive = false
    }
    
    internal func adoptHeight(to content: String) {
        if contentSize.height >= heightThreshHold {
            isScrollEnabled = true
        }
        else if isScrollEnabled {
            textViewHeightConstraint.constant = contentSize.height
            textViewHeightConstraint.isActive = true
            
            if textViewHeightConstraint.constant == initialHeight {
                recoverInitalState()
            }
        }
        else if isIncreasing {
            textViewHeightConstraint.isActive = false
        }
    }
    
    internal func recoverInitalState() {
        self.isScrollEnabled = false
        self.contentSize = CGSize(width: self.contentSize.width, height: initialHeight)
    }
    
}

extension TextViewWithHeightThreshHold: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        guard let text = textView.text else { return }
        adoptHeight(to: text)
    }
}
