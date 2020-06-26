//
//  POSTests.swift
//  POSTests
//
//  Created by Tayson Nguyen on 2019-04-23.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import XCTest
@testable import POS

class TaxViewModelTests: XCTestCase {
    
    let mockTaxItems = [
        TaxItem(label: "VAT", amount: 0.13, isEnabled: true, category: "Dessert"),
        TaxItem(label: "Covid Tax", amount: 0.15, isEnabled: false, category: "All"),
    ]
    
    var sut: TaxViewModel!

    override func setUp() {
         sut = TaxViewModel(taxes: mockTaxItems)
    }

    override func tearDown() {
        sut = nil
    }

    func testTitleOfViewModel() {
        XCTAssertEqual(sut.title(for: 0), "Taxes")
    }
    
    func testNumberOfSectionsForTaxes() {
        XCTAssertEqual(sut.numberOfSections(), 1)
    }
    
    func testNumberOfRowsForTaxes() {
        XCTAssertEqual(sut.numberOfRows(in: 0), 2)
    }
    
    func testLabelForTaxItem() {
        XCTAssertEqual(sut.labelForTax(at: IndexPath(row: 1, section: 0)), "Covid Tax")
    }
    
    func testAccessoryIsCheckedIfTheItemIsSelected() {
        XCTAssertEqual(sut.accessoryType(at: IndexPath(row: 0, section: 0)), .checkmark)
    }
    
    func testItemIsNotSelectedAfterToggling() {
        sut.toggleTax(at: IndexPath(row: 0, section: 0))
        XCTAssertFalse(sut.taxes.first!.isEnabled)
    }

}
