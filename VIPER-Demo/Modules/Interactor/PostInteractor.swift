//
//  PostInteractor.swift
//  VIPER-Demo
//
//  Created by Robert Shrestha on 1/20/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation
import Alamofire


class PostInteractor:PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func fetchPost() {
        let url = APIConstants.baseURL + APIConstants.posts
        Alamofire.request(url).responseJSON { (response) in
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    do {
                        let data = try JSONDecoder().decode([PostsModel].self, withJSONObject: json)
                        self.presenter?.postFetchedSucess(postsArray: data)
                    }catch(let error){
                        self.presenter?.postFetchFailed(error: error)
                        print(error.localizedDescription)
                    }
                }
            }else {
                let errorTemp = NSError(domain:"", code:(response.response?.statusCode)!, userInfo:[NSLocalizedDescriptionKey: "Something went wrong"])
                self.presenter?.postFetchFailed(error: errorTemp)
            }
        }
    }
    
    
}
