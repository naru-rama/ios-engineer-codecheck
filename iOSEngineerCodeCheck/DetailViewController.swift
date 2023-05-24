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
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewWithRepositoryData()
    }
    
    func updateViewWithRepositoryData() {
        guard let safeItem = viewModel?.item else { return }
            
        setupNameLabel(with: safeItem.fullName)
        setupLanguageLabel(with: safeItem.language)
        setupStarCountLabel(with: safeItem.starCount)
        setupWatcherCountLabel(with: safeItem.watcherCount)
        setupForkCountLabel(with: safeItem.forkCount)
        setupIssueCountLabel(with: safeItem.issueCount)
        setupAvatarImageView(with: safeItem.owner.avatarUrl)
    }
    
    func setupNameLabel(with fullName: String) {
        nameLabel.text = fullName
    }
    
    func setupLanguageLabel(with language: String?) {
        languageLabel.text = "Written in \(language ?? "")"
    }
    
    func setupStarCountLabel(with starCount: Int) {
        starCountLabel.text = "\(starCount) stars"
    }
    
    func setupWatcherCountLabel(with watcherCount: Int) {
        watcherCountLabel.text = "\(watcherCount) watchers"
    }
    
    func setupForkCountLabel(with forkCount: Int) {
        forkCountLabel.text = "\(forkCount) forks"
    }
    
    func setupIssueCountLabel(with issueCount: Int) {
        issueCountLabel.text = "\(issueCount) open issues"
    }
    
    func setupAvatarImageView(with urlString: String) {
        viewModel?.downloadImage(from: urlString) { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
    }
    
}
