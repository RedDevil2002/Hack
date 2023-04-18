//
//  NetworkTests.swift
//  
//
//  Created by Brian Seo on 2023-04-18.
//

import XCTest
@testable import Hack

final class NetworkTests: XCTestCase {
    
    let googleURL = "https://www.google.com/"
    
    func testLoadDataCallFromGoogle() throws {
        let manager = Hack.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        
        guard let url = URL(string: googleURL) else {
            return XCTFail("Could not create URL properly")
        }
        
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData, "Response data is nil".capitalized)
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "Error Forming Error Result".capitalized)
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
