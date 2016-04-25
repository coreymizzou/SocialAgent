//
//  ExamineMyPostViewController.swift
//  SocialAgent
//
//  Created by MU IT Program on 4/18/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit
import Parse
import Bolts
import Social


class ExamineMyPostViewController: UIViewController {

    var postText = String()
    var totalRating = Double()
    var dicScore = Double()
    var revScore = Double()
    var numberReviewers = Double()
    var objectId = String()
    /*
    @IBOutlet weak var postTextBox: UITextView!
    @IBOutlet weak var overallRatingLabel: UILabel!
    @IBOutlet weak var dicScoreLabel: UILabel!
    @IBOutlet weak var revScoreLabel: UILabel!
    @IBOutlet weak var numReviewersLabel: UILabel!
    */
    
    
    @IBOutlet weak var twitterIcon: UIImageView!
    @IBOutlet weak var facebookIcon: UIImageView!
    @IBOutlet weak var postTextBox: UITextView!
    @IBOutlet weak var overallRatingLabel: UILabel!
    @IBOutlet weak var dicScoreLabel: UILabel!
    @IBOutlet weak var revScoreLabel: UILabel!
    @IBOutlet weak var numReviewersLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        print("view will appear")
        postTextBox.text = postText
        overallRatingLabel.text = "\(totalRating)"
        dicScoreLabel.text = "\(dicScore)"
        revScoreLabel.text = "\(revScore)"
        numReviewersLabel.text = "\(numberReviewers)"
    }
    
    @IBAction func deletePost(sender: AnyObject) {
        let query = PFQuery(className: "Post")
        query.getObjectInBackgroundWithId(objectId) { (postObject: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let postObject = postObject {
                postObject.deleteInBackground()
                postObject.saveInBackground()
                print("object deleted")
            }
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        if totalRating < 50 {
            facebookIcon.hidden = true
            twitterIcon.hidden = true
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
        print("clicked")
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText(postText)
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
        print("clicked")
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText(postText)
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
