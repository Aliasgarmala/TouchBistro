//
//  Item.swift
//  POS
//
//  Created by Aliasgar Mala on 2020-06-24.
//  Copyright © 2020 TouchBistro. All rights reserved.
//

import Foundation
import BillEngine
//can make isTaxExempt default to false
struct Item: ItemRepresentable {
    let uniqueId: String = UUID().uuidString
    let name: String
    let category: String
    let price: NSDecimalNumber
    var isTaxExempt: Bool
}

