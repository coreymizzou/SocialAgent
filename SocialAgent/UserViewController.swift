//
//  UserViewController.swift
//  SocialAgent
//
//  Created by Capstone on 4/17/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit
import CoreData
import Parse
import Bolts

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userCode: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    struct PostInfo {
        var text = ""
        var id = ""
        var dicScore = 0.0
        var revScore = 0.0
        var totalScore = 0.0
        var numOfReviewers = 0.0
        var objectId = ""
    }
    
    var coreCodes = [NSManagedObject]()
    var arrayOfCodes = [String]()
    var postArray: [PostInfo] = [PostInfo]()
    var count = 0
    var tempCode = ""
    
    @IBAction func submit(sender: AnyObject) {
        saveCodeInCoreData(userCode.text!)
        loadPosts()
    }
    
    func saveCodeInCoreData(code: String) {
        let appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let newcode = NSEntityDescription.insertNewObjectForEntityForName("FriendsCodes", inManagedObjectContext: context)
        newcode.setValue(code, forKey: "code")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save into core data \(error), \(error.userInfo)")
        }
        
        print("code saved in core (FB)")
        print(code)
        loadCodes()
        loadPosts()
    }
    
    /*func loadMyCode() {
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
            print("there was a problem, you have no codes to review, ender a code to begin")
        } else {
            //enter codes into friendsCodes array

        }
        
    }*/
    
    func loadCodes() {
        coreCodes.removeAll()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:"FriendsCodes")
        
        do {
            let fetchedResults =
                try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let results = fetchedResults {
                coreCodes = results
            } else {
                print("Could not fetch pets")
            }
        } catch {
            return
        }
        arrayOfCodes.removeAll()
        for code in coreCodes {
            arrayOfCodes.append(code.valueForKey("code") as! String)
        }
        
    }
    
    func loadPosts() {
        let query = PFQuery(className: "Post")
        var postInfoNode = PostInfo()

        if(coreCodes.count < 1) {
            print("there was a problem, you have no codes to review, ender a code to begin")
        } else {
            query.whereKey("Poster_Id", containedIn: arrayOfCodes)
            
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
                            postInfoNode.numOfReviewers = object.valueForKey("NumberOfReviews") as! Double
                            postInfoNode.objectId = object.objectId!
                            
                            self.postArray.append(postInfoNode)
                            print(self.postArray.count)
                        }
                        print("final count:")
                        print(self.postArray.count)
                        
                        self.tableView.reloadData()
                    }
                } else {
                    print("Error: \(error!)")
                }
            }
            //TableView.reloadData()
        }
    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = postArray[indexPath.row].text
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMyPost" {
            if let destination = segue.destinationViewController as? ExamineMyPostViewController {
                if let index = tableView.indexPathForSelectedRow?.row {
                    destination.dicScore = postArray[index].dicScore
                    destination.postText = postArray[index].text
                    destination.numberReviewers = postArray[index].numOfReviewers
                    destination.revScore = postArray[index].revScore
                    destination.totalRating = postArray[index].totalScore
                    destination.objectId = postArray[index].objectId
                    print("prepared")
                }
            }
        }
    }
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("performing segue")
        self.performSegueWithIdentifier("showMyPost", sender: self)
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
