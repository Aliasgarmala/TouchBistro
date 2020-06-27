//
//  NumberFormatter+Utilties.swift
//  POS
//
//  Created by Aliasgar Mala on 2020-06-27.
//  Copyright © 2020 TouchBistro. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
}
