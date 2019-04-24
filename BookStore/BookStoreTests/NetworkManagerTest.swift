//
//  NetworkManagerTest.swift
//  BookStoreTests
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import XCTest
@testable import BookStore

class NetworkManagerTest: XCTestCase {

    var sut: NetworkManager?
    
    override func setUp() {
        super.setUp()
        sut = NetworkManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_list_books() {

        let sut = self.sut!

        let expect = XCTestExpectation(description: "callback")

        sut.fetchListBooks() { (result) in
            expect.fulfill()

            switch result {
            case .error(let error) :
                print("Error Fetching Data: \(error)")
                break
            case .results(let data):
//                XCTAssertEqual(data.count, 4)
                for book in data {
                    XCTAssertNotNil(book.id)
                }
            }
        }
        wait(for: [expect], timeout: 3.1)
    }
}
