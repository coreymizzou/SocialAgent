//
//  PostViewController.swift
//  SocialAgent
//
//  Created by MU IT Program on 3/3/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var charsLeftLabel: UILabel!
    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var gradeLabel: UILabel!

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        
        if segue.identifier == "showGradeVC" {
            
            let gvc = segue.destinationViewController as! GradeViewController
            
            gvc.copyOfPost = postText.text
            
        }
    }
    
    @IBAction func unwindToPostViewController(segue: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //if let gvc = segue.sourceViewController as? GradeViewController {
            //gvc.newTotal = 0
            //print(gvc.newTotal)
            
        //}
    }
    
    static var sharedPost: PostViewController!
    //var newTotal : Double!
    //var score = Grade.sharedInstance
    
    
    
    //testing
    //func getPost() -> UITextView {
      //  return postText
   // }

    
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
        charsLeftLabel.text = "140"
        postText.delegate = self
        //newTotal = self.score.autoGrade
        //gradeLabel.text = String(newTotal)
        
        super.viewDidLoad()
        PostViewController.sharedPost = self

        // Do any additional setup after loading the view.
    }
    
    func checkRemainingChars() {
        
        let allowedChars = 140
        
        let charsInTextView = -postText.text.characters.count
        
        let remainingChars = allowedChars + charsInTextView
        
        
        if remainingChars <= allowedChars {
            
            charsLeftLabel.textColor = UIColor.blackColor()
            
        }
        
        if remainingChars <= 20 {
            
            charsLeftLabel.textColor = UIColor.orangeColor()
            
        }
        
        if remainingChars <= 10 {
            
            charsLeftLabel.textColor = UIColor.redColor()
        }
        
        
        charsLeftLabel.text = String(remainingChars)
        
        
    }
    
    func textViewDidChange(textView: UITextView) {
        print(postText.text)
        NSLog("Update text")
        //print(newTotal)
        checkRemainingChars()
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        
    }
    
    @IBAction func sendButtonClicked(sender: AnyObject) {
        
        let allowedChars = 140
        
        let charsInTextView = -postText.text.characters.count
        
        let remainingChars = allowedChars + charsInTextView
        
        
        if remainingChars < 0 {
            
            let alert = UIAlertController(title: "Warning: Twitter has a 140 character limit", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        } /*else {
            
            let alert = UIAlertController(title: "Tweet has been posted!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Yay", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }*/
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
