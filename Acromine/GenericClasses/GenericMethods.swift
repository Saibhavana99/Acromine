//
//  GenericMethods.swift
//  Acromine
//
//  Created by Bhavana on 03/03/17.
//  Copyright © 2017 Sai Bhavana. All rights reserved.
//

import Foundation
import UIKit
class GenericMethods {
    class var sharedInstance : GenericMethods {
        struct Static {
            static let instance : GenericMethods = GenericMethods()
        }
        
        return Static.instance
    }
    func showAlertView(_ Title:String, Message:String, OkBtnTitle:String, parentClass:AnyObject)  {
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: OkBtnTitle, style: UIAlertActionStyle.default, handler: nil))
        parentClass.present(alert, animated: true, completion: nil)
    }
    
}
