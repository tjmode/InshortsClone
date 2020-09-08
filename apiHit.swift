//
//  apiHit.swift
//  InShorts Clone
//
//  Created by Tonywilson Jesuraj on 08/09/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import Foundation
var articles: [Articles] = []
func fetchJsonFromNewsApi(urlString: String) {
    let urlRequest = URLRequest(url: URL(string: urlString)! as URL)
    let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
        if error != nil {
            print(error as Any)
            return
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
            mappingData(from: json)
        } catch let error {
            print(error)
        }
    }
    task.resume()
}
