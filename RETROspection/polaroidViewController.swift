//
//  polaroidViewController.swift
//  RETROspection
//
//  Created by Kode With Klossy on 8/7/18.
//  Copyright © 2018 Ally Siva. All rights reserved.
//

import UIKit

class polaroidViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var emojiView: UILabel!
    @IBOutlet weak var captionView: UILabel!
    @IBOutlet weak var dateView: UILabel!
    
    var photos : Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let realPhoto = photos {
            titleView.text = realPhoto.title
            emojiView.text = realPhoto.emoji
            captionView.text = realPhoto.caption
            dateView.text = realPhoto.date
            
print("POP UP BITCH")
            
            if let cellPhotoImageData = realPhoto.imageData {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    imageView.image = cellPhotoImage
                }
            }
        }
    }
}
