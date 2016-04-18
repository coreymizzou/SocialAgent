//
//  ReviewViewController.swift
//  SocialAgent
//
//  Created by Capstone on 4/17/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var humanGrade = 0.00

    @IBAction func goodReview(sender: AnyObject) {
        humanGrade = 100.0
    }
    
    @IBAction func badReview(sender: AnyObject) {
        humanGrade = 0.00
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
