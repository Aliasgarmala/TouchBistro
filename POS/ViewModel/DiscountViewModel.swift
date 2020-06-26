//
//  DiscountViewModel.swift
//  POS
//
//  Created by Aliasgar Mala on 2020-06-24.
//  Copyright © 2020 TouchBistro. All rights reserved.
//

import UIKit

class DiscountViewModel {
    //Observed in RegisterViewModel
    var selectedDiscounts: Box<[Discount]> = Box([])
    var discounts: [Discount]
    
    init(discounts: [Discount]) {
        self.discounts = discounts
        selectedDiscounts.value = getSelectedDiscounts()
    }
    
    func title(for section: Int) -> String {
        return "Discounts"
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return discounts.count
    }
    
    func labelForDiscount(at indexPath: IndexPath) -> String {
        let discount = discounts[indexPath.row]
        return discount.label
    }
    
    func accessoryType(at indexPath: IndexPath) -> UITableViewCell.AccessoryType {
        let discount = discounts[indexPath.row]
        if discount.isEnabled {
            return .checkmark
        } else {
            return .none
        }
    }
    
    func toggleDiscount(at indexPath: IndexPath) {
        discounts[indexPath.row].isEnabled = !discounts[indexPath.row].isEnabled
    }
    
    func setSelectedDiscounts() {
        selectedDiscounts.value = getSelectedDiscounts()
    }
    
    private func getSelectedDiscounts() -> [Discount] {
        return discounts.filter { $0.isEnabled }
    }
}
