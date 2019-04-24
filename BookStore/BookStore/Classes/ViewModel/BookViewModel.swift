//
//  BookViewModel.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class BookViewModel: NSObject {

    // MARK: - Properties
    
    var id: Int!
    var title: String!
    var author: String!
    var price: Int!
    var currency: String!
    var isbn: String!
    var priceAndCurrency: String!
    var bookDescription: String!
    
    
    // MARK: - Init
    
    init(book: Book) {
        self.id = book.id
        self.title = book.title
        self.author = book.author
        self.price = book.price
        self.currency = book.currency
        self.isbn = book.isbn
        self.bookDescription = book.bookDescription
        
    }
    
}
