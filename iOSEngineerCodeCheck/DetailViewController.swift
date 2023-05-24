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
    
    weak var searchViewController: SearchViewController?
    let repositoryDataController = RepositoryDataController()
    let imageDownloader = ImageDownloader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryDataController.searchViewController = searchViewController
        setupViewFromRepository()
    }
    
    func setupViewFromRepository() {
        guard let repository = repositoryDataController.getRepositoryData() else { return }
        nameLabel.text = repository["full_name"] as? String
        languageLabel.text = "Written in \(repository["language"] as? String ?? "")"
        starCountLabel.text = "\(repository["stargazers_count"] as? Int ?? 0) stars"
        watcherCountLabel.text = "\(repository["watchers_count"] as? Int ?? 0) watchers"
        forkCountLabel.text = "\(repository["forks_count"] as? Int ?? 0) forks"
        issueCountLabel.text = "\(repository["open_issues_count"] as? Int ?? 0) open issues"
        
        guard let owner = repository["owner"] as? [String: Any],
              let imageURL = owner["avatar_url"] as? String else { return }
        
        imageDownloader.downloadImage(from: imageURL) { [weak self] (image) in
            guard let self = self else { return }
            self.avatarImageView.image = image
        }
    }
    
}
