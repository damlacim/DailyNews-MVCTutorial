//
//  ViewController.swift
//  DailyNews-MVCTutorial
//
//  Created by Damla Çim on 5.07.2022.
//

import UIKit

// MARK: Enum
enum ViewState {
    case loading
    case done
}

// MARK: Protocol
protocol ArticleViewControllerDelagate: AnyObject {
    func reloadTableView()
}

class ArticleViewController: UIViewController {
    
    // MARK: Delegate
    weak var delegate: ArticleViewControllerDelagate?
    
    // MARK: Private variables
    private var articles: [Article]?
    private var viewStateBlock: ((ViewState) -> Void)?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    // MARK: Functions
    func listenViewModel(with completion: @escaping (ViewState) -> Void) {
        viewStateBlock = completion
    }
    
    private func fetchData() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=8b4b61575b454d3595702ea4ca663c08") else {
            return
        }
        self.viewStateBlock?(.loading)
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articles = articles
                print(articles)
            }
            self.viewStateBlock?(.done)
        }
    }
}

extension ArticleViewController {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func articleIndex(_ index: Int) -> Article {
        guard let article = self.articles?[index] else {
            return Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "")
        }
        return article
    }
}




