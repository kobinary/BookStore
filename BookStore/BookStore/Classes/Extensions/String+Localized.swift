//
//  String+Localized.swift
//  BookStore
//
//  Created by Maria Ortega on 25/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

// MARK: - Alert View

let ALERT_TITLE_BUY = "ALERT_TITLE_BUY"
let ALERT_MESSAGE_BUY = "ALERT_MESSAGE_BUY"

let ALERT_TITLE_NETWORK = "ALERT_TITLE_NETWORK"
let ALERT_MESSAGE_NETWORK = "ALERT_MESSAGE_NETWORK"

// MARK: - Button Action

let OK_BUTTON = "OK_BUTTON"
