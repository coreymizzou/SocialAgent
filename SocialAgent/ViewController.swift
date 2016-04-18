//
//  ViewController.swift
//  SocialAgent
//
//  Created by MU IT Program on 2/22/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//nope

import UIKit
import FBSDKLoginKit
import TwitterKit
import CoreData


class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.frame = CGRectMake(0, 0, 280, 40)
            loginView.center = CGPoint(x: 210, y: 530)// self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }
        
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                    message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.Alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = CGPoint(x: 210, y: 580) //self.view.center
        self.view.addSubview(logInButton)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
                FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, id"]).startWithCompletionHandler { (connection, result, error) -> Void in
                    let strFirstName: String = (result.objectForKey("first_name") as? String)!
                    let strLastName: String = (result.objectForKey("last_name") as? String)!
                    let strFacebookID: String = (result.objectForKey("id") as? String)!
                    print(strFirstName)
                    print(strLastName)
                    print(strFacebookID)
                    //save code
                    self.saveCodeInCoreData(strFacebookID)
                }
            }
        }
    }
    
    func saveCodeInCoreData(code: String) {
        let appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let newcode = NSEntityDescription.insertNewObjectForEntityForName("MyCode", inManagedObjectContext: context)
        newcode.setValue(code, forKey: "code")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save into core data \(error), \(error.userInfo)")
        }
        
        print("code saved in core (FB)")
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                print("User Email is: \(userEmail)")
            }
        })
    }
    
}


