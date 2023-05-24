//
//  DetailViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 中原護 on 2023/05/25.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

class DetailViewModel {
    
    private let imageDownloader: ImageDownloader
    var item: Item?
    
    init(item: Item?, imageDownloader: ImageDownloader = ImageDownloader()) {
        self.item = item
        self.imageDownloader = imageDownloader
    }
    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        imageDownloader.downloadImage(from: urlString, completion: completion)
    }
    
}
