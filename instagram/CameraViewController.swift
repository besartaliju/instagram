//
//  CameraViewController.swift
//  instagram
//
//  Created by Besart Aliju on 3/19/16.
//  Copyright © 2016 Besart Aliju. All rights reserved.
//

import UIKit
import MBProgressHUD

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var postingImage: UIImageView!
    
    @IBOutlet weak var captionTextField: UITextField!
    
    var chosenImage: UIImage!
    
       

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)

        //postingImage.image = chosenImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            
            chosenImage = editedImage
            postingImage.image = chosenImage
            
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
            
        
    }
    
    
    @IBAction func onShare(sender: AnyObject) {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        Post.postUserImage(postingImage.image, withCaption: captionTextField.text) { (success: Bool, error: NSError?) -> Void in
            if success {
                print("posting image")
                self.performSegueWithIdentifier("backHome", sender: nil)
            } else {
                print(error?.localizedDescription)
            }
        }
        
    }

    
    //Create for taking a photo and picking one from photo Libary
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
