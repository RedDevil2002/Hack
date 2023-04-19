import XCTest
@testable import Hack
import SwiftUI
import UIKit

final class HackTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Hack().text, "Hello, World!")
    }
    
    func loadSFSymbolSafely() {
        
        let symbol: Hack.Symbol = ._SquareCircleFill
                
        // Load SFSymbol on UIImage
        let uiImage = UIImage(symbol: symbol)
        
        // Load SFSymbol on Image
        let image = Image(symbol: symbol)
        
    }
}
