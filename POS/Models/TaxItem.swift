//
//  TaxItem.swift
//  POS
//
//  Created by Aliasgar Mala on 2020-06-24.
//  Copyright © 2020 TouchBistro. All rights reserved.
//

import Foundation
import BillEngine
//can make default category to "All"
struct TaxItem: TaxRepresentable {
    let uniqueId: String = UUID().uuidString
    let label: String
    let amount: Double
    var isEnabled: Bool
    let category: String
}
