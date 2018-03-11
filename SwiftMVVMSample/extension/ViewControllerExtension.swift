//
//  ViewControllerExtension.swift
//  SwiftMVVMSample
//
//  Created by Spring Wong on 11/3/2018.
//  Copyright © 2018 Spring Wong. All rights reserved.
//

import Foundation
import UIKit
import Swinject

extension UIViewController {
    
    func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var container : Container {
        return (UIApplication.shared.delegate as! AppDelegate).getContainer()
    }
}
