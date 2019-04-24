//
//  BookStoreTests.swift
//  BookStoreTests
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import XCTest
import Foundation

@testable import BookStore

class BookStoreTests: XCTestCase {

    var sut : MasterViewModel!
    var mockNetwork: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetwork = MockNetworkManager()
        sut = MasterViewModel(manager: mockNetwork)
    }

    override func tearDown() {
        super.tearDown()
        mockNetwork = nil
    }

    func testFetchData() {
        // Given
        mockNetwork.completeListBook = [Book]()
        
        // When
        sut.fetchListBooks()
        
        // Assert
        XCTAssert(mockNetwork!.isFetchDataCalled)
    }
    
    func testCreateCellViewModel() {
        //Given
        let books = StubGenerator().stubListData()
        mockNetwork.completeListBook = books
        
        // When
        sut.fetchListBooks()
        mockNetwork.fetchSuccess()
        
        // Assert
        XCTAssertEqual(sut.books.count, books.count)
    }
    
    func testGetCellViewModel() {
        //Given a sut with fetched
        goToFetchDataFinished()
        
        let indexPath = IndexPath(row: 1, section: 0)
        let testBook = mockNetwork.completeListBook[indexPath.row]
        
        // When
        let vm = sut.books[indexPath.row]
        
        //Assert
        XCTAssertEqual(vm.title, testBook.title)
    }
}

class MockNetworkManager: NetworkManagerProtocol {
    
    var isFetchDataCalled = false
    var completeListBook: [Book] = [Book]()
    var completeListBookClosure: ((Result<Array<Book>>) -> ())!
    var completeBookClosure: ((Result<Book>) -> ())!

    func fetchListBooks(completion: @escaping (Result<Array<Book>>) -> ()) {
        isFetchDataCalled = true
        completeListBookClosure = completion
        completion(Result.error(.emptyData))
    }
    
    func fetchBook(id: Int, completion: @escaping (Result<Book>) -> ()) {
        isFetchDataCalled = true
        completeBookClosure = completion
        completion(Result.error(.emptyData))
    }
    
    func fetchSuccess() {
        completeListBookClosure(Result.results(completeListBook))
    }
    
    func fetchFail() {
        completeListBookClosure(Result.error(.emptyData))
    }
}

extension BookStoreTests {
    
    private func goToFetchDataFinished() {
        mockNetwork.completeListBook = StubGenerator().stubListData()
        sut.fetchListBooks()
        mockNetwork.fetchSuccess()
    }
}


class StubGenerator {
    
    func stubListData() -> Array<Book> {
        let json: [[String:AnyObject]]!
        var listBooks = Array<Book>()
        
        if let path = Bundle.main.path(forResource: "ListBooks", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data) as? [[String : AnyObject]]
                listBooks = Parser.parseListBooks(array: json)
            } catch { }
        }
        return listBooks
    }
}

