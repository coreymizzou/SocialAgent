//
//  ExamineMyPostViewController.swift
//  SocialAgent
//
//  Created by MU IT Program on 4/18/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit

class ExamineMyPostViewController: UIViewController {

    var postText = String()
    var totalRating = Double()
    var dicScore = Double()
    var revScore = Double()
    var numberReviewers = Int()
    
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
