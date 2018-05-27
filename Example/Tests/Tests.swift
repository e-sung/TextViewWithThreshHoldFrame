import XCTest
import TextViewWithThreshHoldFrame_Example
@testable import TextViewWithThreshHoldFrame

class Tests: XCTestCase {
    
    var sut: TextViewWithHeightThreshHold!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? TestViewController else {
            XCTFail()
            return
        }
        _ = viewController.view
        sut = viewController.textView
    }
    
    func testIsThreshHoldActive() {
        sut.isHeightThreshHoldActive = true
        XCTAssert(sut.isHeightThreshHoldActive)
        sut.isHeightThreshHoldActive = false
        XCTAssertFalse(sut.isHeightThreshHoldActive)
    }
    
    func testIsIncreasing() {
        sut.text = "a word"
        XCTAssert(sut.isIncreasing )
        
        sut.text = "word"
        XCTAssertFalse(sut.isIncreasing)
    }
    
    func testRecoverInitialState() {
        sut.recoverInitalState()
        XCTAssert(sut.isScrollEnabled == false)
        XCTAssert(sut.frame.size.height == 33)
    }
    
    func testTextViewDidChange() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? TestViewController else {
            XCTFail()
            return
        }
        _ = viewController.view
        sut = viewController.textView
        sut.text = "One Line"
        XCTAssertFalse(sut.isScrollEnabled)
        
        sut.insertText("\n")
        sut.sizeToFit()
        sut.insertText("\n")
        sut.sizeToFit()
        sut.insertText("\n")
        sut.sizeToFit()
        sut.insertText("\n")
        sut.sizeToFit()
        sut.insertText("\n")
        sut.sizeToFit()
        sut.insertText("\n")
        sut.sizeToFit()
        sut.insertText("\n")
        sut.sizeToFit()
        XCTAssert(sut.isScrollEnabled)
        
        let range  = sut.textRange(from: sut.beginningOfDocument, to: sut.endOfDocument)!
        sut.replace(range, withText: "one Line")
        sut.sizeToFit()
        XCTAssertFalse(sut.isScrollEnabled)
    }
    
    
}
