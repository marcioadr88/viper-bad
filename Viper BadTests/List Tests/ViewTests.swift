//
//  ViewTests.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-21.
//

import XCTest
@testable import Viper_Bad

class ViewTests: XCTestCase {
    private var view: CharactersListViewController!
    private var presenter: MockViewToPresenterProtocol!
    
    override func setUp() {
        presenter = MockViewToPresenterProtocol()
        
        view = CharactersListViewController.instantiate()
        view.presenter = presenter
        
        let _ = view.view // in order to invoke view.loadView()
    }
    
    func testShowCharacters() {
        view.showCharacters(characters: testCharactersList)
        
        let numberOfRowsInTableView = view.tableView.numberOfRows(inSection: 0)
        
        XCTAssertEqual(numberOfRowsInTableView, testCharactersList.count, "Expect number of cell shown is \(testCharactersList.count)")
        
        let firstCell = view.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(firstCell?.textLabel?.text, testCharactersList[0].name, "Expect content to be equal")
    }
    
    func testViewWillAppearDidRequestCharacterList() {
        view.viewWillAppear(false)
        
        XCTAssert(presenter?.countGetAllCharacters == 1, "Expect getAllCharacters called once on viewWillAppear()")
    }
}
