//
//  Parser.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class Parser {

    // MARK: - Parse List of Books
    
    static func parseListBooks(array: [[String: AnyObject]]) -> Array<Book> {
        var arrayBooks = Array<Book>()
        
        for dictionary in array {
            if let book = parseBook(dictionary: dictionary) {
                arrayBooks.append(book)
            }
        }
        return arrayBooks.sorted(by: { $0.id < $1.id })
    }
    
    // MARK: - Parse Book

    static func parseBook(dictionary: [String: AnyObject]) -> Book! {
        
        let descp = dictionary[Constants.BookKeys.bookDescription] as? String ?? nil
        
        if let bookId = dictionary[Constants.BookKeys.id] as? Int,
            let title = dictionary[Constants.BookKeys.title] as? String,
            let author = dictionary[Constants.BookKeys.author] as? String,
            let isbn = dictionary[Constants.BookKeys.isbn] as? String,
            let price = dictionary[Constants.BookKeys.price] as? Int,
            let currency = dictionary[Constants.BookKeys.currencyCode] as? String {
            
            let book = Book.init(id: bookId, title: title, author: author, price: price, currency: currency, isbn: isbn, bookDescription: descp)
            return book
        }
        return nil
    }
}
