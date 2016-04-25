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
        var dicScore = 0.0
        var revScore = 0.0
        var totalScore = 0.0
        var numOfReviewers = 0
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
                        postInfoNode.dicScore = object.valueForKey("DictionaryScore") as! Double
                        postInfoNode.revScore = object.valueForKey("ReviewerScore") as! Double
                        postInfoNode.totalScore = object.valueForKey("Score") as! Double
                        postInfoNode.numOfReviewers = object.valueForKey("NumberOfReviews") as! Int
                        
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("performing segue") 
        self.performSegueWithIdentifier("showMyPost", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMyPost" {
            if let destination = segue.destinationViewController as? ExamineMyPostViewController {
                if let index = myPostsTableView.indexPathForSelectedRow?.row {
                    destination.dicScore = postArray[index].dicScore
                    destination.postText = postArray[index].text
                    destination.numberReviewers = postArray[index].numOfReviewers
                    destination.revScore = postArray[index].revScore
                    destination.totalRating = postArray[index].totalScore
                    print("prepared")
                }
            }
        }
    }
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("petInfo", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "petInfo"
        {
            if let destination = segue.destinationViewController as? PetImWatchingInfoViewController{
                if let petIndex = tableView.indexPathForSelectedRow?.row {
                    let corePet = corePets[petIndex]
                    
                    let name = corePet.valueForKeyPath("sit_name") as! String
                    let key = corePet.valueForKey("sit_key") as! String
                    let bio = corePet.valueForKey("sit_bio") as! String
                    let feed = corePet.valueForKey("sit_feeding") as! String
                    let act = corePet.valueForKey("sit_activity") as! String
                    let contact = corePet.valueForKey("sit_contact") as! String
                    let number = corePet.valueForKey("sit_number") as! String
                    
                    destination.name_of_pet = name
                    destination.key_of_pet = key
                    destination.pet_bio_passed = bio
                    destination.feed_passed = feed
                    destination.act_passed = act
                    destination.contact_name = contact
                    destination.contact_number = number
                    
                    
                    
                }
            }
        }
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
