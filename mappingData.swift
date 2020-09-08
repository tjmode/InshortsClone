//
//  mappingData.swift
//  InShorts Clone
//
//  Created by Tonywilson Jesuraj on 08/09/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import Foundation

func mappingData(from json: [String: AnyObject]) {
    articles = [Articles]()
    if let articlesFromJson = json["articles"] as? [[String: AnyObject]] {
        for articleFromJson in articlesFromJson {
            let article = Articles()
            if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let imgUrl = articleFromJson["urlToImage"] as? String {
                article.author = author
                article.desc = desc
                article.headLines = title
                article.url = url
                article.imgURL = imgUrl
            }
            articles.append(article)
        }
       
    }
}
