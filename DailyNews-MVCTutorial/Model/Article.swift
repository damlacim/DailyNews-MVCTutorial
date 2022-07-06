//
//  Article.swift
//  DailyNews-MVCTutorial
//
//  Created by Damla Çim on 5.07.2022.
//

import Foundation

struct ArticleList: Decodable {
    var articles: [Article]
}

struct Article: Decodable {
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
}
