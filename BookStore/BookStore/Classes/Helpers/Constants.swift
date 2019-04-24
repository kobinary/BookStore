//
//  Constants.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

struct Constants {
    
    // MARK: - Tabs API Constants
    
    struct BookURLParams {
        static let APIScheme = "http"
        static let APIHost = "tpbookserver.herokuapp.com"
        static let APIPath = "/books"
    }
    
    // MARK: - Model Keys Constants
    
    struct BookKeys {
        static let id = "id"
        static let title = "title"
        static let author = "author"
        static let isbn = "isbn"
        static let price = "price"
        static let currencyCode = "currencyCode"
        static let bookDescription = "description"
    }
}
