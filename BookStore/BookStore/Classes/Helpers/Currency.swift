//
//  Currency.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class Currency {
    
    static let shared: Currency = Currency()
    
    private var cache: [String:String] = [:]
    
    func findSymbol(currencyCode:String) -> String {
        if let hit = cache[currencyCode] { return hit }
        guard currencyCode.count < 4 else { return "" }
        
        let symbol = findSymbolBy(currencyCode)
        cache[currencyCode] = symbol
        
        return symbol
    }
    
    private func findSymbolBy(_ currencyCode: String) -> String {
        var candidates: [String] = []
        let locales = NSLocale.availableLocaleIdentifiers
        
        for localeId in locales {
            guard let symbol = findSymbolBy(localeId, currencyCode) else { continue }
            if symbol.count == 1 { return symbol }
            candidates.append(symbol)
        }
        
        return candidates.sorted(by: { $0.count < $1.count }).first ?? ""
    }
    
    private func findSymbolBy(_ localeId: String, _ currencyCode: String) -> String? {
        let locale = Locale(identifier: localeId)
        return currencyCode.caseInsensitiveCompare(locale.currencyCode ?? "") == .orderedSame
            ? locale.currencySymbol : nil
    }
}

