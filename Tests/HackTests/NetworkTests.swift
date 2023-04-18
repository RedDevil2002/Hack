//
//  NetworkTests.swift
//  
//
//  Created by Brian Seo on 2023-04-18.
//

import XCTest
@testable import Hack

class NetworkSessionMock: NetworkSession {
    var data: Data?
    var error: Error?
    
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        
        completionHandler(data, error)
    }
    
}

struct MockData: Codable, Equatable {
    var id: Int
    var name: String
}

final class NetworkTests: XCTestCase {
    
    let googleURL = "https://www.google.com/"
    
    func testLoadDataCallFromGoogle() throws {
        let manager = Hack.Networking.Manager()
        let session = NetworkSessionMock()
        manager.session = session
        
        let expectation = XCTestExpectation(description: "Called for data")
        
        let data = Data([0, 1, 0, 1])
        session.data = data
        
        let url = URL(fileURLWithPath: "url")
//        guard let url = URL(string: googleURL) else {
//            return XCTFail("Could not create URL properly")
//        }
//
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
    
    func testSendDataCall() {
        // GIVEN
        let session = NetworkSessionMock()
        let manager = Hack.Networking.Manager()
        let sampleObject = MockData(id: 3, name: "John")
        
        let data = try? JSONEncoder().encode(sampleObject)
        session.data = data
        
        manager.session = session
        let url = URL(fileURLWithPath: "url")
        let expectation = XCTestExpectation(description: "Sent Data")
        
        // WHEN
        manager.sendData(to: url, body: sampleObject) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                let returnedData = try? JSONDecoder().decode(MockData.self, from: returnedData)
                XCTAssertEqual(returnedData, sampleObject)
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "Error Forming Error Result".capitalized)
            }
        }
        
        // THEN
        wait(for: [expectation], timeout: 3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
