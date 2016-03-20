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
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var instagramPost: PFObject!{
        didSet {
            self.postedImage.file = instagramPost["media"] as? PFFile
            self.postedImage.loadInBackground()
            self.captionLabel.text = instagramPost["caption"] as? String
            self.usernameLabel.text = PFUser.currentUser()?.username
            self.profileImage.image = UIImage(named: "besartprofilepicture.png")
            self.profileImage.layer.borderWidth = 1.0
            self.profileImage.layer.masksToBounds = false
            self.profileImage.layer.borderColor = UIColor.whiteColor().CGColor
            self.profileImage.layer.cornerRadius = profileImage.frame.size.width/2
            self.profileImage.clipsToBounds = true
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    

}
