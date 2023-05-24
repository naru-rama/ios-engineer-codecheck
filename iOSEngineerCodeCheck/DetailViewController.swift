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
    
    var searchViewController: SearchViewController?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let searchVC = searchViewController else { return }
        
        let repository = searchVC.repositories[searchVC.selectedRepositoryIndex]
        languageLabel.text = "Written in \(repository["language"] as? String ?? "")"
        starCountLabel.text = "\(repository["stargazers_count"] as? Int ?? 0) stars"
        watcherCountLabel.text = "\(repository["wachers_count"] as? Int ?? 0) watchers"
        forkCountLabel.text = "\(repository["forks_count"] as? Int ?? 0) forks"
        issueCountLabel.text = "\(repository["open_issues_count"] as? Int ?? 0) open issues"
        
        getImage()
    }
    
    func getImage(){
        guard let searchVC = searchViewController else { return }
        let repository = searchVC.repositories[searchVC.selectedRepositoryIndex]
        nameLabel.text = repository["full_name"] as? String
        
        //画像をダウンロードしてavatarImageViewで表示
        guard let owner = repository["owner"] as? [String: Any],
              let imageURL = owner["avatar_url"] as? String,
              let url = URL(string: imageURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }.resume()
    }
    
}
