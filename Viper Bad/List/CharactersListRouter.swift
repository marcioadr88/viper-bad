//
//  ListRouter.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-15.
//

import Foundation
import UIKit

class CharactersListRouter: PresenterToRouterProtocol {
    static var module: UIViewController {
        let view = CharactersListViewController.instantiate()
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = CharactersListPresenter()
        let interactor: PresenterToInteractorProtocol = CharactersListInteractor(repository: CharactersListRouter.breakingBadRespository)
        let router: PresenterToRouterProtocol = CharactersListRouter()
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        
        return view
    }
    
    static var breakingBadRespository: BreakingBadRepository {
        guard let breakingBadRespository = (UIApplication.shared.delegate as? AppDelegate)?.breakingBadRespository else {
            fatalError(NSLocalizedString("Cannot get repository.", comment: ""))
        }
        
        return breakingBadRespository
    }
}
