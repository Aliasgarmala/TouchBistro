//
//  RegisterViewModel.swift
//  POS
//
//  Created by Aliasgar Mala on 2020-06-23.
//  Copyright © 2020 TouchBistro. All rights reserved.
//

import Foundation
import BillEngine

class RegisterViewModel {
    
    private(set) var taxViewModel = TaxViewModel(taxes: taxes)
    private(set) var discountViewModel = DiscountViewModel(discounts: discounts)
    private var selectedTaxItems: [TaxItem] = []
    private var selectedDiscounts: [Discount] = []
    
    init() {
        configureBindings()
    }
    
    private func configureBindings() {
        taxViewModel.selectedTaxItems.bind { [weak self] (selectedTaxItems) in
            self?.selectedTaxItems = selectedTaxItems
            self?.calculateBill()
        }
        
        discountViewModel.selectedDiscounts.bind { [weak self] (discounts) in
            self?.selectedDiscounts = discounts
            self?.calculateBill()
        }
    }
    
    //whenever an item is added or deleted calculate the bill
    var orderItems: [Item] = [] {
        didSet {
            calculateBill()
        }
    }
    
    //Observed in RegisterViewController
    var subTotalBox: Box<String> = Box("0.00")
    var discountsBox: Box<String> = Box("0.00")
    var taxBox: Box<String> = Box("0.00")
    var totalBox: Box<String> = Box("0.00")
    
    func menuCategoryTitle(in section: Int) -> String? {
        return categories[section].name
    }
    
    func orderTitle(in section: Int) -> String? {
        return "Bill"
    }
    
    func numberOfMenuCategories() -> Int {
        return categories.count
    }
    
    func numberOfMenuItems(in section: Int) -> Int {
        return categories[section].items.count
    }
    
    func numberOfOrderItems(in section: Int) -> Int {
        return orderItems.count
    }
    
    func menuItemName(at indexPath: IndexPath) -> String? {
        return categories[indexPath.section].items[indexPath.row].name
    }
    
    func menuItemPrice(at indexPath: IndexPath) -> String? {
        let price = categories[indexPath.section].items[indexPath.row].price
        return NumberFormatter.currencyFormatter.string(from: price)
    }
    
    func labelForOrderItem(at indexPath: IndexPath) -> String? {
        let item = orderItems[indexPath.row]
       
        if item.isTaxExempt {
            return "\(item.name) (No Tax)"
        } else {
            return item.name
        }
    }
    
    func orderItemPrice(at indexPath: IndexPath) -> String? {
        let price = orderItems[indexPath.row].price
        return NumberFormatter.currencyFormatter.string(from: price)
    }
    
    func addItemToOrder(at indexPath: IndexPath) -> IndexPath {
        let item = categories[indexPath.section].items[indexPath.row]
        orderItems.append(item)
        return IndexPath(row: orderItems.count - 1, section: 0)
    }
    
    func removeItemFromOrder(at indexPath: IndexPath) {
        orderItems.remove(at: indexPath.row)
    }
    
    private func calculateBill() {
        
        let bill = BillGenerator.generateBillItemsFor(orderItems: orderItems, taxItems: selectedTaxItems, discountItems: selectedDiscounts)
        
        subTotalBox.value = bill.preTaxTotal
        taxBox.value = bill.taxTotal
        discountsBox.value = bill.discountTotal
        totalBox.value = bill.postTaxAndDiscountTotal
    }
}
