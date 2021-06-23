//
//  ApiService.swift
//  NewsApp
//
//  Created by keva on 21/06/21.
//

import Foundation
import SwiftyJSON

class ApiService: ObservableObject {
    @Published var news = [NewsModel]()
    
    init() {
        let source = "https://newsapi.org/v2/everything?q=apple&from=2021-06-20&to=2021-06-20&sortBy=popularity&apiKey=1a6e1839a2a24f9ba661a34552c1d318"
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
                
        session.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            for articles in json["articles"] {
                let title = articles.1["title"].stringValue
                let datePublished = articles.1["publishedAt"].stringValue
                let description = articles.1["description"].stringValue
                let urlToImage = articles.1["urlToImage"].stringValue
                let content = articles.1["content"].stringValue
                let url = articles.1["url"].stringValue
                
                DispatchQueue.main.async {
                    self.news.append(NewsModel(title: title, description: description, image: urlToImage, url: url, publishedAt: datePublished, content: content))
                }
            }
            
        }.resume()
    }
}
