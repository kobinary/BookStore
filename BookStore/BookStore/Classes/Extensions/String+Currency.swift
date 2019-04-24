//
//  String+Currency.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

extension String {
    var currencySymbol: String { return Currency.shared.findSymbol(currencyCode: self) }
}

