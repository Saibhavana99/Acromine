//
//  RootApi.swift
//  Acromine
//
//  Created by Bhavana on 03/03/17.
//  Copyright © 2017 Sai Bhavana. All rights reserved.
//

import Foundation
import UIKit

class RootApi{
    func fetchResource( _ resource: String,completion: @escaping ( _ inner: @escaping () throws -> NSArray? ) -> Void ) {
        
        let baseURL = APIConfig.EndPoint.baseURL
        // create the request
        let url = URL(string:baseURL+resource)!
        var request = URLRequest(url: url)
        request.httpMethod = APIConfig.EndPoint.GETMethod
        let config = URLSessionConfiguration.default
        //create session
        let session = URLSession(configuration: config)
        // make the request
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            guard let data = data else { // not an error actually...
                print("empty data")
                return
            }
            if error != nil {
                print(error!)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonDict = json as? NSArray {
                        if (jsonDict.count>0){
                            let result = jsonDict.object(at: 0) as! NSDictionary
                             let jsonArray = result.value(forKey: "lfs") as! NSArray
                            completion({ return jsonArray} )

                        } else {  completion({ return jsonDict} ) }

                        
                        return
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
        })
        task.resume()
    }
}
