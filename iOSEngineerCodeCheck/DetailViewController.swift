//
//  DetailViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var watcherCountLabel: UILabel!
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var issueCountLabel: UILabel!
    
    var item: Item?
    let imageDownloader = ImageDownloader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewFromRepository()
    }
    
    func setupViewFromRepository() {
        guard let safeItem = item else { return }
        
        nameLabel.text = safeItem.fullName
        setLabelText(label: languageLabel, text: safeItem.language ?? "", prefix: "Written in")
        setLabelText(label: starCountLabel, text: "\(safeItem.starCount)", prefix: "stars")
        setLabelText(label: watcherCountLabel, text: "\(safeItem.watcherCount)", prefix: "watchers")
        setLabelText(label: forkCountLabel, text: "\(safeItem.forkCount)", prefix: "forks")
        setLabelText(label: issueCountLabel, text: "\(safeItem.issueCount)", prefix: "open issues")
        
        let imageURL = safeItem.owner.avatarUrl
        imageDownloader.downloadImage(from: imageURL) { [weak self] (image) in
            guard let self = self else { return }
            self.avatarImageView.image = image
        }
    }
    
    func setLabelText(label: UILabel, text: String, prefix: String) {
        label.text = "\(text) \(prefix)"
    }
    
}
