//
//  PhotoCell.swift
//  instagram
//
//  Created by Besart Aliju on 3/19/16.
//  Copyright © 2016 Besart Aliju. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var postedImage: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var instagramPost: PFObject!{
        didSet {
            self.postedImage.file = instagramPost["media"] as? PFFile
            self.postedImage.loadInBackground()
            self.captionLabel.text = instagramPost["caption"] as? String
            self.usernameLabel.text = instagramPost["author"] as? String
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
