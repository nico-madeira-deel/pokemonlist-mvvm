//
//  AppNicoMVVMUITests.swift
//  AppNicoMVVMUITests
//
//  Created by Tag Livros on 16/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import XCTest

class AppNicoMVVMUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPokemonDetail() {
        let myTableView = app.tables.matching(identifier: AccessibilityIdentifier.pokemonListTableView.rawValue)
        let cell = myTableView.cells.element(matching: .cell, identifier: "\(AccessibilityIdentifier.detailPokemonTableCell.rawValue)0")
        let pokemonName = AccessibilityIdentifier.pokemonName.rawValue
        let pokemonInfo = AccessibilityIdentifier.pokemonInfo.rawValue
        let pokemonImage = AccessibilityIdentifier.pokemonImage.rawValue
        cell.tap()
        XCTAssertEqual(app.staticTexts[pokemonName].label, "Bulbasaur")
        XCTAssertEqual(app.staticTexts[pokemonInfo].label, "Height: 7")
        XCTAssertTrue(app.images[pokemonImage].exists)
    }
    
    func testGoBackToPokemonList() {
        let myTableView = app.tables.matching(identifier: AccessibilityIdentifier.pokemonListTableView.rawValue)
        let cell = myTableView.cells.element(matching: .cell, identifier: "\(AccessibilityIdentifier.detailPokemonTableCell.rawValue)0")
        let goBackButton = app.navigationBars.buttons.element(boundBy: 0)
        cell.tap()
        XCTAssertTrue(goBackButton.exists)
        XCTAssertEqual(goBackButton.label, AccessibilityIdentifier.goBackToList.rawValue)
        goBackButton.tap()
    }
}
