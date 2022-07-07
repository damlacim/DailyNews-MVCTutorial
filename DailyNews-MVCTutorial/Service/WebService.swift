//
//  WebService.swift
//  DailyNews-MVCTutorial
//
//  Created by Damla Çim on 7.07.2022.
//

import Foundation

class WebService {
    // MARK: Function
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(data)
            }
        }
        task.resume()
    }
}
