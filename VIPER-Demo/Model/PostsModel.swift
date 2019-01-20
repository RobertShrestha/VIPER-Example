//
//  PostsModel.swift
//  VIPER-Demo
//
//  Created by Robert Shrestha on 1/20/19.
//  Copyright © 2019 robert. All rights reserved.
//

import UIKit

class PostsModel: NSObject,Decodable {
    var user_id:Int?
    var id:Int?
    var title:String?
    var body:String?
    
    private enum PostsCodingKey:String,CodingKey {
        case user_id = "userId"
        case id
        case title
        case body
    }
    

}
