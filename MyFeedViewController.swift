//
//  ViewController.swift
//  InShorts Clone
//
//  Created by Sunitha Balasubramanian on 28/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit
import Gemini

class MyFeedViewController: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet weak var collectionView: GeminiCollectionView!
    var newsFeedOnTapCount = -1
    var articles: [Articles] = []
    var selectedNewsUrl: URL!
    var models = [MyFeedModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.delegate = collectionView as? UIGestureRecognizerDelegate
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.delegate = collectionView as? UIGestureRecognizerDelegate
        self.view.addGestureRecognizer(swipeRight)
        
        fetchJsonFromNewsApi(urlString: "https://newsapi.org/v2/top-headlines?country=us&apikey=d5e190072c4a4b039a1ba5df5f7fd9e3")
        
        
        navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
      
        collectionView.gemini
            .cubeAnimation()
            .cubeDegree(90)
        
        let discoverButton = UIBarButtonItem(title: "Discover", style: .plain, target: self, action: #selector(moveToDiscoverViewController))
        discoverButton.tintColor = .gray
        let backbutton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(moveToDiscoverViewController))
        navigationItem.leftBarButtonItems = [backbutton,discoverButton]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: nil)
        navigationItem.title = "My News Feed"
        navigationItem.hidesBackButton = false
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.left:
                    let webPageViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "webPage") as! WebPageViewController
                    self.navigationController?.pushViewController(webPageViewController, animated: true)
                    webPageViewController.url = selectedNewsUrl                
                case UISwipeGestureRecognizer.Direction.right:
                    let discoverViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "discoverVC")
                    self.navigationController?.view.layer.add(CATransition().pushViewControllerFromLeftSide(), forKey: nil)
                    self.navigationController?.pushViewController(discoverViewController, animated: true)
                default:
                    break
            }
        }
    }
    
//    func fetchJsonFromNewsApi() {
//        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apikey=d5e190072c4a4b039a1ba5df5f7fd9e3")! as URL)
//        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
//            if error != nil {
//                print(error as Any)
//                return
//            }
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
//                self.mappingData(from: json)
//            } catch let error {
//                print(error)
//            }
//        }
//        task.resume()
//    }
//    func mappingData(from json: [String: AnyObject]) {
//        self.articles = [Articles]()
//        if let articlesFromJson = json["articles"] as? [[String: AnyObject]] {
//            for articleFromJson in articlesFromJson {
//                let article = Articles()
//                if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let imgUrl = articleFromJson["urlToImage"] as? String {
//                    article.author = author
//                    article.desc = desc
//                    article.headLines = title
//                    article.url = url
//                    article.imgURL = imgUrl
//                }
//                self.articles.append(article)
//            }
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//    }
}


extension MyFeedViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! MyFeedCollectionViewCell
        models.append(MyFeedModel(headLines: self.articles[indexPath.item].headLines, desc: self.articles[indexPath.item].desc, imgURL: self.articles[indexPath.item].imgURL))
//        cell.headerImageView.downloadImage(url: (self.articles[indexPath.item].imgURL) ?? "")
//        cell.newsDescriptionLabel.text = self.articles[indexPath.item].desc
//        cell.newsHeadingLabel.text = self.articles[indexPath.item].headLines
        self.collectionView.animateCell(cell)
        selectedNewsUrl = URL(string: self.articles[indexPath.item].url ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collectionView.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? MyFeedCollectionViewCell {
            self.collectionView.animateCell(cell)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        newsFeedOnTapCount = newsFeedOnTapCount + 1
        if newsFeedOnTapCount % 2 == 0{
            navigationController?.isNavigationBarHidden = false
            tabBarController?.tabBar.isHidden = false
        }else{
            navigationController?.isNavigationBarHidden = true
            tabBarController?.tabBar.isHidden = true
        }
    }
    @objc func moveToDiscoverViewController() {
        let discoverviewController = self.storyboard!.instantiateViewController(identifier: "discoverVC") as! DiscoverViewController
        self.navigationController!.pushViewController(discoverviewController, animated: true)
    }
    
    
}
