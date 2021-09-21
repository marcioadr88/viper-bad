//
//  RouterTests.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-21.
//

import XCTest
@testable import Viper_Bad

class RouterTests: XCTestCase {
    private var router: CharactersListRouter!
    
    override func setUp() {
        router = CharactersListRouter()
    }
    
    func testModule() {
        guard let _ = CharactersListRouter.module as? CharactersListViewController else {
            XCTFail("Expect module is CharactersListViewController.")

            return
        }
    }
}
