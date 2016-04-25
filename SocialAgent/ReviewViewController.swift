//
//  ReviewViewController.swift
//  SocialAgent
//
//  Created by Capstone on 4/17/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ReviewViewController: UIViewController {
    
    var humanGrade = 0.00
    var postText = String()
    var totalRating = Double()
    var dicScore = Double()
    var revScore = Double()
    var numberReviewers = Double()
    var objectId = String()
    
    
    @IBOutlet weak var postTextView: UITextView!

    @IBAction func goodReview(sender: AnyObject) {
        humanGrade = 100.0
        updateScore(humanGrade)
    }
    
    @IBAction func badReview(sender: AnyObject) {
        humanGrade = 0.00
        updateScore(humanGrade)
    }
    
    func updateScore(humanGrade: Double) {
        numberReviewers += 1
        revScore = ((revScore * (numberReviewers - 1))+(humanGrade))/(numberReviewers)
        totalRating = (dicScore+revScore)/2
        let query = PFQuery(className: "Post")
        query.getObjectInBackgroundWithId(objectId) { (postObject: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let postObject = postObject {
                postObject["ReviewerScore"] = self.revScore
                postObject["Score"] = self.totalRating
                postObject.saveInBackground()
            }
        }
    }
    
    override func viewDidLoad() {
        postTextView.text = postText
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
