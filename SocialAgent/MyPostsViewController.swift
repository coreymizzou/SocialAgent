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
import CoreData

class MyPostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myPostsTableView: UITableView!
    
    struct PostInfo {
        var text = ""
        var id = ""
        var objectID = ""
    }
    var userCode = "1234"
    
    var postArray: [PostInfo] = [PostInfo]()
    var count = 0
    
    override func viewWillAppear(animated: Bool) {
        loadMyCode()
        loadPosts()
    }
    
    func loadMyCode() {
        var codes = [NSManagedObject]()
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "MyCode")
        
        do {
            let results = try context.executeFetchRequest(request)
            codes = results as! [NSManagedObject]
        } catch let error as NSError {
            print("there was an error fetching \(error)")
        }
        
        if(codes.count < 1) {
            print("there was a problem, code auto set to load posts from '1235'")
            userCode = "1235"
        } else {
            let code = codes[0]
            userCode = (code.valueForKey("code") as? String)!
        }

    }
    
    func loadPosts() {
        let query = PFQuery(className: "Post")
        var postInfoNode = PostInfo()
        query.whereKey("Poster_Id", equalTo: userCode)
        
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
