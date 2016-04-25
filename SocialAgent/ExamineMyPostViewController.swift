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
            }
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
