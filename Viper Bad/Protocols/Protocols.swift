//
//  Protocols.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-15.
//

import Foundation
import UIKit

// View --> Presenter
protocol ViewToPresenterProtocol: AnyObject {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    
    func getAllCharacters()
}

// Presenter --> View
protocol PresenterToViewProtocol: AnyObject {
    var presenter: ViewToPresenterProtocol? { get set }
    
    func showCharacters(characters: [Character])
    func showError(message: String)
}

// Presenter --> Router
protocol PresenterToRouterProtocol: AnyObject {
    static var module: UIViewController { get }
}

// Presenter --> Interactor
protocol PresenterToInteractorProtocol: AnyObject {
    var presenter: InteractorToPresenterProtocol? {get set}
    
    func getAllCharacters()
}

// Interactor --> Presenter
protocol InteractorToPresenterProtocol: AnyObject {
    func getAllCharactersSuccess(characters: [Character])
    func getAllCharactersError(error: AppError)
}
