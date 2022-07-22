//
//  ViewController.swift
//  DailyNews-MVCTutorial
//
//  Created by Damla Çim on 5.07.2022.
//

import UIKit

class ArticleViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Private variables
    private var articles: [Article]?
    private var selectIndex = 0
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Setup functions
    private func setup() {
        setupTableView()
        fetchData()
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: Functions
    private func fetchData() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=8b4b61575b454d3595702ea4ca663c08") else {
            return
        }
        WebService().getArticles(url: url) { [weak self] articles in
            if let articles = articles {
                self?.articles = articles
                print(articles)
                self?.reloadTableView()
            }
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: Extensions
extension ArticleViewController {
 
    // MARK: Functions
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

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell",for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleIndex = self.articleIndex(indexPath.row)
        cell.titleLabel.text = articleIndex.title
        cell.descriptionLabel.text = articleIndex.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectIndex = indexPath.row
        print(selectIndex)
        performSegue(withIdentifier: "detail", sender: self)
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            let articleVM = self.articleIndex(selectIndex)
            detailViewController.articles = articleVM
            print(articleVM)
        }
    }
}




