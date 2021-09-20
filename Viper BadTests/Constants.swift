//
//  Constants.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-20.
//

import Foundation
@testable import Viper_Bad

let testCharactersList = [
    Character(id: 1,
              name:"Mock Name 1",
              birthday: "11/11/11",
              occupation: ["Mock occupation 1-1", "Mock occupation 1-2"],
              img: "http://one.mock.mock",
              status: "Mock status 1",
              nickname: "Mock nickname 1",
              appearance: [11, 12],
              portrayed: "Mock portrayed 1",
              category: "Mock category 1"),
    Character(id: 2,
              name:"Mock Name 2",
              birthday: "12/12/12",
              occupation: ["Mock occupation 2-1", "Mock occupation 2-2"],
              img: "http://two.mock.mock",
              status: "Mock status 2",
              nickname: "Mock nickname 2",
              appearance: [21, 22],
              portrayed: "Mock portrayed 2",
              category: "Mock category 2")
]

let testErrorMessage = "Test error message"

let testAppError = AppError.apiError(message: testErrorMessage)
