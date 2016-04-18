//
//  MyPostsViewController.swift
//  SocialAgent
//
//  Created by MU IT Program on 4/18/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit
import Parse
import Bolts

class MyPostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myPostsTableView: UITableView!
    
    struct PostInfo {
        var text = ""
        var id = ""
    }
    
    var postArray: [PostInfo] = [PostInfo]()
    var count = 0
    
    override func viewWillAppear(animated: Bool) {
        loadPosts()
        myPostsTableView.reloadData()
    }
    
    func loadPosts() {
        let query = PFQuery(className: "Post")
        var postInfoNode = PostInfo()
        query.whereKey("Poster_Id", equalTo: "1234")
        
        /*let objects = query.findObjects()
         
         if let objects = objects {
         for object in objects {
         print(object.objectId)
         postInfoNode.id = object.valueForKey("Poster_Id")! as! String
         postInfoNode.text = object.valueForKey("Text")! as! String
         self.postArray.append(postInfoNode)
         print(self.postArray.count)
         }
         }*/
        
        
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) in
            if (error == nil) {
                if let objects = objects {
                    self.postArray.removeAll()
                    for object in objects {
                        print(object.objectId)
                        postInfoNode.id = object.valueForKey("Poster_Id")! as! String
                        postInfoNode.text = object.valueForKey("Text")! as! String
                        self.postArray.append(postInfoNode)
                        print(self.postArray.count)
                    }
                    print("final count:")
                    print(self.postArray.count)

                    self.myPostsTableView.reloadData()
                }
            } else {
                print("Error: \(error!)")
            }
        }
        //TableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        myPostsTableView.reloadData()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TableView data sources methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count at time of loading: ")
        print(postArray.count)
        return postArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = postArray[indexPath.row].text
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
