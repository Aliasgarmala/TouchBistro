//
//  Menu.swift
//  POS
//
//  Created by Tayson Nguyen on 2019-04-23.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import Foundation

//typealias Item = (name: String, category: String, price: NSDecimalNumber, isTaxExempt: Bool)

func category(_ category: String) -> ((String, NSDecimalNumber, Bool) -> Item) {
    return { name, price, isTaxExempt in
        return Item(name: name, category: category, price: price, isTaxExempt: isTaxExempt)
    }
}


let appetizers = category("Appetizers")
let mains = category("Mains")
let drinks = category("Drinks")
let alcohol = category("Alcohol")

let appetizersCategory = [
    appetizers("Nachos", 13.99, false),
    appetizers("Calamari", 11.99, false),
    appetizers("Caesar Salad", 10.99, false),
]

let mainsCategory = [
    mains("Burger", 9.99, false),
    mains("Hotdog", 3.99, false),
    mains("Pizza", 12.99, false),
]

let drinksCategory = [
    drinks("Water", 0, true),
    drinks("Pop", 2.00, true),
    drinks("Orange Juice", 3.00, true),
]

let alcoholCategory = [
    alcohol("Beer", 5.00, false),
    alcohol("Cider", 6.00, false),
    alcohol("Wine", 7.00, false),
]
//make this category with the help of protocol only valid categories
let tax1 = TaxItem(label: "Tax 1 (5%)", amount: 0.05, isEnabled: true, category: "All")
let tax2 = TaxItem(label: "Tax 2 (8%)", amount: 0.08, isEnabled: false, category: "All")
let alcoholTax = TaxItem(label: "Alcohol Tax (10%)", amount: 0.10, isEnabled: true, category: "Alcohol")

let discount5Dollars = Discount(label: "$5.00", amount: 5.00, isEnabled: false, discountType: .dollarAmount)
let discount10Percent = Discount(label: "10%", amount: 0.10, isEnabled: false, discountType: .percentage)
let discount20Percent = Discount(label: "20%", amount: 0.20, isEnabled: false, discountType: .percentage)

var taxes = [
    tax1,
    tax2,
    alcoholTax,
]

var discounts = [
    discount5Dollars,
    discount10Percent,
    discount20Percent,
]

var categories = [
    (name: "Appetizers", items: appetizersCategory),
    (name: "Mains", items: mainsCategory),
    (name: "Drinks", items: drinksCategory),
    (name: "Alcohol", items: alcoholCategory),
]
