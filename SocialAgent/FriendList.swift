//
//  FriendList.swift
//  SocialAgent
//
//  Created by Capstone on 3/23/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import Foundation
import Accounts
import Social
import FBSDKCoreKit
import UIKit
import FBSDKShareKit
import CoreData


class FriendList: UIViewController {
    //TESTING asdf more testing
    /*
    @IBAction func FacebookFriends(sender: AnyObject) {
        let request : FBSDKGraphRequest = FBSDKGraphRequest(graphPath:"/me/friends", parameters: nil)
        request.startWithCompletionHandler { (connection : FBSDKGraphRequestConnection!, result : AnyObject!, error : NSError!) -> Void in
            if error == nil {
                print("Friends are : \(result)")
            }
            else {
                print("Error Getting Friends \(error)")
            }
        }
     */

    
    //TESTING
    
    
    /*
     
     var request = FBSDKGraphRequest(graphPath:"/me/taggable_friends", parameters: nil);
     request.startWithCompletionHandler { (connection : FBSDKGraphRequestConnection!, result : AnyObject!, error : NSError!) -> Void in
     if error == nil {
     println("Friends are : \(result)")
     } else {
     println("Error Getting Friends \(error)");
     }
     }
     */
    
    /*
     var request = FBSDKGraphRequest(graphPath:"/me/friends", parameters: nil);
     request.startWithCompletionHandler
     {
     (connection:FBRequestConnection!,   result:AnyObject!, error:NSError!) -> Void in
     var resultdict = result as NSDictionary
     println("Result Dict: \(resultdict)")
     var data : NSArray = resultdict.objectForKey("data") as NSArray
     
     for i in 0 ..< data.count
     {
     let valueDict : NSDictionary = data[i] as NSDictionary
     let id = valueDict.objectForKey("id") as String
     println("the id value is \(id)")
     }
     
     var friends = resultdict.objectForKey("data") as NSArray
     println("Found \(friends.count) friends")
     }
     */
    //TESTING

    @IBOutlet weak var codeLabel: UILabel!

    override func viewDidLoad() {
        loadMyCode()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            print("there was a problem, no code to load")
        } else {
            let code = codes[codes.count - 1]
            codeLabel.text = (code.valueForKey("code") as? String)!
        }
        
    }
}
//facebook login manager
class LoginManager: NSObject {
    
    var facebookAccount: ACAccount?
    
    func facebookLogin(completion: (credential: ACAccountCredential?) -> Void) {
        let store = ACAccountStore()
        let facebook = store.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierFacebook)
        let apiKey = "426579954202175"
        let loginParameters: [NSObject: AnyObject] = [ACFacebookAppIdKey: apiKey, ACFacebookPermissionsKey: []]
        store.requestAccessToAccountsWithType(facebook, options: loginParameters) { granted, error in
            if granted {
                let accounts = store.accountsWithAccountType(facebook)
                self.facebookAccount = accounts.last as? ACAccount
                
                let credentials = self.facebookAccount?.credential
                completion(credential: credentials)
            } else {
                completion(credential: nil)
            }
        }
    }
}