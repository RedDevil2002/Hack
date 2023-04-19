//
//  SymboTests.swift
//  
//
//  Created by Brian Seo on 2023-04-18.
//

import XCTest
import UIKit
@testable import Hack

final class SymboTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Accepts all valid symbols. Test random 300 elements out of 4400
    func testSymbolsValidImages() throws {
        // GIVEN
        let symbols = Hack.Symbol.allCases
        
        for _ in 0...300 {
            
            if let symbol = symbols.randomElement() {
                // WHEN
                let image = UIImage(symbol: symbol)
                
                // THEN
                XCTAssertNotEqual(image, nil, "SFSymbol should be valid but failed to load")
            }
        }
    }
    
    // Rejects invalid symbol
    func testInvalidSFSymbol() throws {
        let invalidSymbol = "INVALIDGARBAGE"
        let image = UIImage(systemName: invalidSymbol)
        XCTAssertEqual(image, nil, "INVALID SFSymbol should not be loaded")
    }
}
