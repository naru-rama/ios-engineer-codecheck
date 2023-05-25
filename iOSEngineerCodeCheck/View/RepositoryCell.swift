//
//  RepositoryCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/25.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var searchImageView: UIImageView!
    
    @IBOutlet weak var languageTextLabel: UILabel!
    @IBOutlet weak var starTextLabel: UILabel!
    @IBOutlet weak var forkTextLabel: UILabel!
    @IBOutlet weak var issueTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.searchImageView.layer.cornerRadius = self.searchImageView.bounds.height / 2
        self.searchImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
