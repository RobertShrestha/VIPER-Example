//
//  PostListProtocols.swift
//  VIPER-Demo
//
//  Created by Robert Shrestha on 1/20/19.
//  Copyright © 2019 robert. All rights reserved.
//

import UIKit
import Foundation

protocol ViewToPresenterProtocol: class{
    var view:PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? {get set}
    var router:PresenterToRouterProtocol? {get set}
    func startFetchingPosts()
    func showPostListingController(navigationController:UINavigationController)
    
}
protocol PresenterToViewProtocol: class{
    func showPosts(postArray:Array<PostsModel>)
    func showError(error:Error)
}
protocol PresenterToRouterProtocol: class {
    static func createModule()-> PostListingViewController
    func pushToCommentsScreen(navigationController:UINavigationController)
}
protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchPost()
}
protocol InteractorToPresenterProtocol: class  {
    func postFetchedSucess(postsArray:Array<PostsModel>)
    func postFetchFailed(error:Error)
}

