//
//  TaxViewModel.swift
//  POS
//
//  Created by Aliasgar Mala on 2020-06-24.
//  Copyright © 2020 TouchBistro. All rights reserved.
//

import UIKit

class TaxViewModel {
    
    var selectedTaxItems: Box<[TaxItem]> = Box([])
    var taxes: [TaxItem]
    
    init(taxes: [TaxItem]) {
        self.taxes = taxes
        selectedTaxItems.value = getSelectedTaxes()
    }
    
    func title(for section: Int) -> String {
        return "Taxes"
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return taxes.count
    }
    
    func labelForTax(at indexPath: IndexPath) -> String {
        let tax = taxes[indexPath.row]
        return tax.label
    }
    
    func accessoryType(at indexPath: IndexPath) -> UITableViewCell.AccessoryType {
        let tax = taxes[indexPath.row]
        if tax.isEnabled {
            return .checkmark
        } else {
            return .none
        }
    }
    
    func toggleTax(at indexPath: IndexPath) {
        taxes[indexPath.row].isEnabled = !taxes[indexPath.row].isEnabled
    }
    
    func setSelectedTaxes() {
        selectedTaxItems.value = getSelectedTaxes()
    }
    
    private func getSelectedTaxes() -> [TaxItem] {
        return taxes.filter { $0.isEnabled }
    }
}

