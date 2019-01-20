//
//  PostPresenter.swift
//  VIPER-Demo
//
//  Created by Robert Shrestha on 1/20/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation
import UIKit

class PostPresenter:ViewToPresenterProtocol{
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingPosts() {
        interactor?.fetchPost()
    }
    
    func showPostListingController(navigationController: UINavigationController) {
        router?.pushToCommentsScreen(navigationController: navigationController)
    }
    
    
}
extension PostPresenter:InteractorToPresenterProtocol{
  
    
    func postFetchedSucess(postsArray: Array<PostsModel>) {
        view?.showPosts(postArray: postsArray)
    }
    func postFetchFailed(error: Error) {
        view?.showError(error: error)
    }
   
    
    
}
