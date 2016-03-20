//
//  ViewController.swift
//  instagram
//
//  Created by Besart Aliju on 3/18/16.
//  Copyright © 2016 Besart Aliju. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import MBProgressHUD

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [PFObject]?
    var time: NSDate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
        getData()
    }
    
    func getData(){
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            
            if let posts = posts {
                self.posts = posts
                MBProgressHUD.hideHUDForView(self.view, animated: true)
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil {
            return posts!.count
        } else {
            return 0
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
        let photo = posts![indexPath.row]
        cell.instagramPost = posts![indexPath.row]
        time = photo.createdAt!
        let timeSince = timePassed(time!)
        if timeSince >= 86400 {
            cell.timeLabel.text = "\(Int(timeSince)/86400)d"
        } else if timeSince >= 3600 {
            cell.timeLabel.text = "\(Int(timeSince)/3600)h"
        } else if timeSince >= 60 {
            cell.timeLabel.text = "\(Int(timeSince)/60)m"
        } else {
            cell.timeLabel.text = "\(Int(timeSince))s"
        }
        
        return cell
        
        
    }
    
    func timePassed(time: NSDate) -> NSTimeInterval {
        let now = NSDate()
        let timePassed = now.timeIntervalSinceDate(time)
        return timePassed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

