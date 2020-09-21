//
//  apiHit.swift
//  InShorts Clone
//
//  Created by Tonywilson Jesuraj on 08/09/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import Foundation
//class fetchJsonFromNewsApi {
//}
func fetchJsonFromNewsApi(urlString: String, handler: @escaping (_ jsonData: [String: AnyObject]?, _ errorInSide: String?) -> Void) {
    let urlRequest = URLRequest(url: URL(string: urlString)! as URL)
    let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
        if error != nil {
            print(error as Any)
            handler(nil, error?.localizedDescription)
            return
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]

            handler(json, nil)
        } catch let error {
            print(error)
            handler(nil, error.localizedDescription)
        }
    }
    task.resume()
}
