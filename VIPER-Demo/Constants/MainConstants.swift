//
//  MainConstants.swift
//  VIPER-Demo
//
//  Created by Robert Shrestha on 1/20/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation
import UIKit


struct APIConstants{
    static let baseURL  = "https://jsonplaceholder.typicode.com"
    static let posts = "/posts"
}
struct Storyboards{
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
