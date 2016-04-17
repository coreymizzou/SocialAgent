//
//  UserViewController.swift
//  SocialAgent
//
//  Created by Capstone on 4/17/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userCode: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        let password:NSString = userCode.text!
        
        if (password.isEqualToString("12345") ) {
            self.performSegueWithIdentifier("reviewSegue", sender: self)
        }
        else {
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Incorrect Password"
            alertView.message = "Please enter Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
