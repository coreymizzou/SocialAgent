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

class UserViewController: UIViewController {

    @IBOutlet weak var userCode: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        let password:NSString = userCode.text!
        
        if (password.isEqualToString("1234") ) {
            self.performSegueWithIdentifier("reviewSegue", sender: self)
        }
        else {
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Invalid Code"
            alertView.message = "Please enter Code"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        
        
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
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
