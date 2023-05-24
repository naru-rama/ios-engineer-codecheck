//
//  RepositoryCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/25.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageVIew: UIImageView!
    
    @IBOutlet weak var languageTextLabel: UILabel!
    @IBOutlet weak var starTextLabel: UILabel!
    @IBOutlet weak var forkTextLabel: UILabel!
    @IBOutlet weak var issueTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
