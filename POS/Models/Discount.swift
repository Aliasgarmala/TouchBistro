//
//  Discount.swift
//  POS
//
//  Created by Aliasgar Mala on 2020-06-24.
//  Copyright © 2020 TouchBistro. All rights reserved.
//

import Foundation
import BillEngine

struct Discount: DiscountRepresentable {
    var uniqueId: String = UUID().uuidString
    let label: String
    let amount: Double
    var isEnabled: Bool
    let discountType: Type
}
