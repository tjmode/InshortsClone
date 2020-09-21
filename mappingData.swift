//
//  mappingData.swift
//  
//
//  Created by Tonywilson Jesuraj on 09/09/20.
//

import Foundation

func mappingdata() {
    fetchJsonFromNewsApi(urlString: "https://newsapi.org/v2/top-headlines?country=us&apikey=d5e190072c4a4b039a1ba5df5f7fd9e3") { (json, errorMessage) in
                 if let articlesFromJson = json?["articles"] as? [[String: AnyObject]] {
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
                     DispatchQueue.main.async {
                         collectionView.reloadData()

                     }
             }
         }
}
