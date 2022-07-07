//
//  DetailViewController.swift
//  DailyNews-MVCTutorial
//
//  Created by Damla Çim on 7.07.2022.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    public var articles: Article?
    
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func navigateButtonClicked(_ sender: UIButton) {
    }
}
