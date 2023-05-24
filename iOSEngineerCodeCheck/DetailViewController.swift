//
//  ViewController2.swift
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
    
    var searchViewController: SearchViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repository = searchViewController.repositories[searchViewController.selectedRepositoryIndex]
        
        languageLabel.text = "Written in \(repository["language"] as? String ?? "")"
        starCountLabel.text = "\(repository["stargazers_count"] as? Int ?? 0) stars"
        watcherCountLabel.text = "\(repository["wachers_count"] as? Int ?? 0) watchers"
        forkCountLabel.text = "\(repository["forks_count"] as? Int ?? 0) forks"
        issueCountLabel.text = "\(repository["open_issues_count"] as? Int ?? 0) open issues"
        getImage()
        
    }
    
    func getImage(){
        
        let repository = searchViewController.repositories[searchViewController.selectedRepositoryIndex]
        
        nameLabel.text = repository["full_name"] as? String
        
        if let owner = repository["owner"] as? [String: Any] {
            if let avatarImageURL = owner["avatar_url"] as? String {
                URLSession.shared.dataTask(with: URL(string: avatarImageURL)!) { (data, response, error) in
                    let image = UIImage(data: data!)!
                    DispatchQueue.main.async {
                        self.avatarImageView.image = image
                    }
                }.resume()
            }
        }
        
    }
    
}
