//
//  Post.swift
//  instagram
//
//  Created by Besart Aliju on 3/19/16.
//  Copyright © 2016 Besart Aliju. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
    
        let post = PFObject(className: "Post")
        
        post["media"] = getPFFileFromImage(image)
        post["author"] = PFUser.currentUser()
        post["caption"] = caption
        
        post.saveInBackgroundWithBlock(completion)
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image){
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}
