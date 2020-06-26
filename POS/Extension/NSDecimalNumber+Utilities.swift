//
//  NSDecimalNumber+Utilities.swift
//  POS
//
//  Created by Aliasgar Mala on 2020-06-24.
//  Copyright © 2020 TouchBistro. All rights reserved.
//

import Foundation

extension Array where Element == NSDecimalNumber {
    func sumOfAll() -> NSDecimalNumber {
        let sum =  self.reduce(0) { (count, partialSum) in
            partialSum.adding(count)
        }
        return sum
    }
}

extension NumberFormatter {
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
}

extension NSDecimalNumber {
    
    var currencyValue: String {
        return NumberFormatter.currencyFormatter.string(from:self) ?? "$0.00"
    }
}
