//
//  GradeViewController.swift
//  SocialAgent
//
//  Created by Capstone on 3/7/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit
import Social


class GradeViewController: UIViewController {
    
    
    @IBOutlet weak var cannotPost: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var twitterImage: UIImageView!
    @IBOutlet weak var facebookImage: UIImageView!
    @IBOutlet weak var textFromPost: UITextView!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var submit: UIButton!
    
    var copyOfPost: String?
    
    var score = Grade.sharedInstance
    var newTotal : Double!
    
    static var sharedPost: GradeViewController?
    
    
    override func viewDidLoad() {
        cannotPost.hidden = true
        submit.hidden = false
        textFromPost.text = copyOfPost
        newTotal = self.score.autoGrade
        print(newTotal)
        total.text = String(newTotal)
        if newTotal <= 50.00 {
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Unacceptable"
            alertView.message = "Please edit post or wait for review before continuing"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            cannotPost.hidden = false
            submit.hidden = false
            facebookImage.hidden = true
            twitterImage.hidden = true
            postLabel.hidden = true
            textFromPost.editable = true
            newTotal = self.score.autoGrade
            total.text = String(newTotal)
        }
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     //Posting to twitter
     */
    @IBAction func twitterButton(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText(copyOfPost)
            self.presentViewController(twitterSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    /*
     //Posting to facebook
     */
    @IBAction func facebookButton(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText(copyOfPost)
            self.presentViewController(facebookSheet, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
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
