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
        static let APIBooksPath = "/books"
        static let APIBookPath = "/book/"
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

// MARK: - String Constants

let LOADING_VIEW_NAME = "LoadingView"
let NAV_DETAIL_IDENTIFIER = "DetailNavigation"
let MASTER_VIEW_CELL_IDENTIFIER = "BookViewCell"

let ALERT_TITLE = "Do you want to buy it?"
let ALERT_MESSAGE = "Just wait to be implemented!"
let ALERT_OK_BUTTON = "OK"
