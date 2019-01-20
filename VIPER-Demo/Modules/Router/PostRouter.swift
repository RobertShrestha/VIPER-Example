//
//  PostRouter.swift
//  VIPER-Demo
//
//  Created by Robert Shrestha on 1/20/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation
import UIKit

class PostRouter:PresenterToRouterProtocol{
    static func createModule() -> PostListingViewController {
        let view = Storyboards.mainstoryboard.instantiateViewController(withIdentifier: "PostListingViewController") as! PostListingViewController
        let presentor:ViewToPresenterProtocol & InteractorToPresenterProtocol = PostPresenter()
        let interactor:PresenterToInteractorProtocol = PostInteractor()
        let router:PresenterToRouterProtocol = PostRouter()
        
        view.presentor = presentor
        presentor.view = view
        presentor.router = router
        presentor.interactor = interactor
        interactor.presenter = presentor
        
        return view
        
    }
    
    func pushToCommentsScreen(navigationController: UINavigationController) {
        
    }
    
    
}
