import XCTest
@testable import AL_Extensions

final class FoundationTests: XCTestCase {
    
    // MARK: - String
    func testTrim() {
        let text = " Trim Test "
        XCTAssertEqual(text.trim(), "Trim Test")
        XCTAssertNotEqual(text, "Trim Test")
    }
    
    func testUppercasedTurkish() {
        XCTAssert("çeşme".uppercasedTurkish == "ÇEŞME")
        XCTAssert("soner".uppercasedTurkish == "SONER")
        XCTAssert("ismail".uppercasedTurkish == "İSMAİL")
    }
    
    func testIsValidEmail() {
        let validEmail = "soner.guler@applogist.com"
        let nonValidEmail = "soner.guler@applogist"
        XCTAssert(validEmail.isValidEmail())
        XCTAssert(!nonValidEmail.isValidEmail())
    }
    
    
    // MARK: - Bool
    
    func testToInt() {
        XCTAssert(true.toInt() == 1)
        XCTAssert(false.toInt() == 0)
    }
    
    func testToStr() {
        XCTAssert(true.toStr() == "true".lowercased())
        XCTAssert(false.toStr() == "false".lowercased())
    }
    
    
    // MARK: - Bundle
    
    func testVersionNumber() {
        let ver = (Bundle().infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
        XCTAssert(Bundle().versionNumber == ver)
    }
    
    // App build Number
    func testBuildNumber() {
        let num = (Bundle().infoDictionary?["CFBundleVersion"] as? String) ?? ""
        XCTAssert(num == Bundle().buildNumber)
    }
    
    /// App bundle name
    func testBundleName() {
        let name =  (Bundle().infoDictionary?["CFBundleName"] as? String) ?? ""
        XCTAssert(name == Bundle().bundleName)
    }
    
    
    // MARK: Collection
    
    func testCollection() {
        var list = [String]()
        XCTAssert(list[safe: 0] == nil)
        list.append("s")
        XCTAssert(list[safe: 0] == "s")
    }
    
    
    // MARK: - Double
    
    func testTLFormatted() {
        let value: Double = 200
        XCTAssert(value.TLFormatted() == "200,00 TL")
    }
    
    func testCurrencyFormatted() {
        let value: Double = 200
        XCTAssert(value.currencyFormatted() == "200,00")
    }
    
    func testRounded() {
        XCTAssert(10.4.rounded() == 10.0)
    }
    
    func testDeg2Rad() {
        XCTAssert(90.0.deg2rad() == 1.5707963267948966)
    }
    
    
    //MARK: - Int
    
    func testConvertSecondToDigitResult() {
        XCTAssert(100.convertSecondToDigitResult() == "01:40")
        XCTAssert(45.convertSecondToDigitResult() == "00:45")
    }
    
    
    // MARK: - TimeInterval
    
    func testConvertMilisecondToDigitResult() {
        XCTAssert(20000000.convertMilisecondToDigitResult() == "05:33:20")
        XCTAssert(198231.convertMilisecondToDigitResult() == "03:18")
    }
    
    
    // MARK: - Color
    
    func testHex() {
        let color = UIColor.hex(hex: "#ffffff")
        XCTAssert(color.hexString.caseInsensitiveCompare("#ffffff") == .orderedSame)
    }
}
