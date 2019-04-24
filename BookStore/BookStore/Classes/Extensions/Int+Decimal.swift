//
//  Int+Decimal.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

private let minorCurrencyUnit : Float = 100.00

extension Int {
    var delimiter: String {
        let float: Float = Float(self) / minorCurrencyUnit
        return "\(float)"
    }
    
}

