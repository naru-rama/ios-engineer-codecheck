//
//  SortViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/26.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

protocol SortViewControllerDelegate: AnyObject {
    func sortViewController(_ viewController: SortViewController, didChooseSortOption sortOption: String?, sortOrder: String?, perPage: Int?)
    func resetCell()
}

class SortViewController: UIViewController {

    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var forkButton: UIButton!
    @IBOutlet weak var issueButton: UIButton!
    @IBOutlet weak var updaatedButton: UIButton!
    @IBOutlet weak var descButton: UIButton!
    @IBOutlet weak var ascButton: UIButton!
    
    weak var delegate: SortViewControllerDelegate?
    
    var sortOption: String = ""
    var sortOrder: String = ""
    var conditionButtons: [UIButton] {
        return [starButton, forkButton, issueButton, updaatedButton]
    }
    var orderButtons: [UIButton] {
        return [descButton, ascButton]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conditionButtons.forEach { $0.isSelected = false }
        orderButtons.forEach {
            if $0 != descButton {
                $0.isSelected = false
            }
        }
    }
    
    @IBAction func conditionButtonPressed(_ sender: UIButton) {
        conditionButtons.forEach { $0.isSelected = false }
        sender.isSelected = true
        
        switch sender {
        case starButton:
            sortOption = "stars"
        case forkButton:
            sortOption = "forks"
        case issueButton:
            sortOption = "help-wanted-issues"
        case updaatedButton:
            sortOption = "updated"
        default:
            break
        }
    }
    
    @IBAction func orderButtonPressed(_ sender: UIButton) {
        orderButtons.forEach { $0.isSelected = false }
        sender.isSelected = true
        
        switch sender {
        case descButton:
            sortOrder = "desc"
        case ascButton:
            sortOrder = "asc"
        default:
            break
        }
    }
    
    
    @IBAction func sortButtonPressed(_ sender: UIButton) {
        delegate?.resetCell()
        delegate?.sortViewController(self, didChooseSortOption: sortOption, sortOrder: sortOrder, perPage: 30)
        dismiss(animated: true, completion: nil)
    }
    
}
