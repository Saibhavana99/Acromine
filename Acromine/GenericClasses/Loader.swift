//
//  Loader.swift
//  Acromine
//
//  Created by Bhavana on 03/03/17.
//  Copyright © 2017 Sai Bhavana. All rights reserved.
//

import UIKit
import MBProgressHUD
class Loader: NSObject {
    
    class func show(message:String = "Loading...", delegate: UIViewController) {
        var load : MBProgressHUD = MBProgressHUD()
        load = MBProgressHUD.showAdded(to: delegate.view, animated: true)
        if message.characters.count > 0 {
            load.label.text = message
        }
        load.backgroundView.style = MBProgressHUDBackgroundStyle.solidColor
        load.backgroundView.color = UIColor.init(white: 0.0, alpha: 0.1)
        load.mode = MBProgressHUDMode.indeterminate
        
    }
    
    class func hide(delegate:UIViewController) {
        DispatchQueue.main.async {
               MBProgressHUD.hide(for: delegate.view, animated: true)
    }
}
}
