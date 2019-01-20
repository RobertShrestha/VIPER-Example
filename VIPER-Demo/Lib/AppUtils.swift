//
//  CustomExtension.swift
//  VIPER-Demo
//
//  Created by Robert Shrestha on 1/20/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation
import UIKit


/* Show Progress Indicator */
func showProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = false
    
    // Create and add the view to the screen.
    let progressIndicator = ProgressIndicator(text: "Please wait..")
    progressIndicator.tag = 10
    view.addSubview(progressIndicator)
    
}

/* Hide progress Indicator */
func hideProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(10) {
        viewWithTag.removeFromSuperview()
    }
    
}
