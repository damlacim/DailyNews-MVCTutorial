//
//  DetailViewController.swift
//  DailyNews-MVCTutorial
//
//  Created by Damla Çim on 7.07.2022.
//

import Foundation
import UIKit
import Kingfisher
import SafariServices

class DetailViewController: UIViewController {
    
    // MARK: Variables
    public var articles: Article?
    
    // MARK: IBOutlets
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: IBAction
    @IBAction func navigateButtonClicked(_ sender: UIButton) {
        guard let url = URL(string: articles!.url) else {
            return
        }
        let viewController = SFSafariViewController(url: url)
        present(viewController,animated: true)
    }
    
    // MARK: Function
    private func updateUI() {
        publishedLabel.text = articles?.publishedAt
        descriptionLabel.text = articles?.description
        image.kf.setImage(with: URL(string: articles!.urlToImage))
    }
}
