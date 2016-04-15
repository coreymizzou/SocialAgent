//
//  GradeViewController.swift
//  SocialAgent
//
//  Created by Capstone on 3/7/16.
//  Copyright © 2016 TequillaMockingbird. All rights reserved.
//

import UIKit
import Social
import Foundation


//list of words
var dictionary: [String] =
    ["2g1c",
     "2 girls 1 cup",
     "acrotomophilia",
     "alabama hot pocket",
     "alaskan pipeline",
     "anal",
     "anilingus",
     "anus",
     "apeshit",
     "arsehole",
     "ass",
     "asshole",
     "assmunch",
     "auto erotic",
     "autoerotic",
     "babeland",
     "baby batter",
     "baby juice",
     "ball gag",
     "ball gravy",
     "ball kicking",
     "ball licking",
     "ball sack",
     "ball sucking",
     "bangbros",
     "bareback",
     "barely legal",
     "barenaked",
     "bastard",
     "bastinado",
     "bbw",
     "bdsm",
     "beaner",
     "beaners",
     "beaver cleaver",
     "beaver lips",
     "bestiality",
     "big black",
     "big breasts",
     "big knockers",
     "big tits",
     "bimbos",
     "birdlock",
     "bitch",
     "bitches",
     "black cock",
     "blonde action",
     "blonde on blonde action",
     "blowjob",
     "blow job",
     "blow your load",
     "blue waffle",
     "blumpkin",
     "bollocks",
     "bondage",
     "boner",
     "boob",
     "boobs",
     "booty call",
     "brown showers",
     "brunette action",
     "bukkake",
     "bulldyke",
     "bullet vibe",
     "bullshit",
     "bung hole",
     "bunghole",
     "busty",
     "butt",
     "buttcheeks",
     "butthole",
     "camel toe",
     "camgirl",
     "camslut",
     "camwhore",
     "carpet muncher",
     "carpetmuncher",
     "chocolate rosebuds",
     "circlejerk",
     "cleveland steamer",
     "clit",
     "clitoris",
     "clover clamps",
     "clusterfuck",
     "cock",
     "cocks",
     "coprolagnia",
     "coprophilia",
     "cornhole",
     "coon",
     "coons",
     "creampie",
     "cum",
     "cumming",
     "cunnilingus",
     "cunt",
     "darkie",
     "date rape",
     "daterape",
     "deep throat",
     "deepthroat",
     "dendrophilia",
     "dick",
     "dildo",
     "dirty pillows",
     "dirty sanchez",
     "doggie style",
     "doggiestyle",
     "doggy style",
     "doggystyle",
     "dog style",
     "dolcett",
     "domination",
     "dominatrix",
     "dommes",
     "donkey punch",
     "double dong",
     "double penetration",
     "dp action",
     "dry hump",
     "dvda",
     "eat my ass",
     "ecchi",
     "ejaculation",
     "erotic",
     "erotism",
     "escort",
     "ethical slut",
     "eunuch",
     "faggot",
     "fecal",
     "felch",
     "fellatio",
     "feltch",
     "female squirting",
     "femdom",
     "figging",
     "fingerbang",
     "fingering",
     "fisting",
     "foot fetish",
     "footjob",
     "frotting",
     "fuck",
     "fuck buttons",
     "fuckin",
     "fucking",
     "fucktards",
     "fudge packer",
     "fudgepacker",
     "futanari",
     "gang bang",
     "gay sex",
     "genitals",
     "giant cock",
     "girl on",
     "girl on top",
     "girls gone wild",
     "goatcx",
     "goatse",
     "god damn",
     "gokkun",
     "golden shower",
     "goodpoop",
     "goo girl",
     "goregasm",
     "grope",
     "group sex",
     "g-spot",
     "guro",
     "hand job",
     "handjob",
     "hard core",
     "hardcore",
     "heil hitler",
     "hentai",
     "homoerotic",
     "honkey",
     "hooker",
     "hot carl",
     "hot chick",
     "how to kill",
     "how to murder",
     "huge fat",
     "humping",
     "incest",
     "intercourse",
     "jack off",
     "jail bait",
     "jailbait",
     "jelly donut",
     "jerk off",
     "jigaboo",
     "jiggaboo",
     "jiggerboo",
     "jizz",
     "juggs",
     "jungle bunny",
     "kike",
     "kinbaku",
     "kinkster",
     "kinky",
     "knobbing",
     "leather restraint",
     "leather straight jacket",
     "lemon party",
     "lolita",
     "lovemaking",
     "make me come",
     "male squirting",
     "masturbate",
     "menage a trois",
     "milf",
     "missionary position",
     "motherfucker",
     "mound of venus",
     "mr hands",
     "muff diver",
     "muffdiving",
     "nambla",
     "nawashi",
     "negro",
     "neonazi",
     "nigga",
     "nigger",
     "nig nog",
     "nimphomania",
     "nipple",
     "nipples",
     "nsfw images",
     "nude",
     "nudity",
     "nympho",
     "nymphomania",
     "octopussy",
     "omorashi",
     "one cup two girls",
     "one guy one jar",
     "orgasm",
     "orgy",
     "paedophile",
     "paki",
     "panties",
     "panty",
     "pedobear",
     "pedophile",
     "pegging",
     "penis",
     "phone sex",
     "piece of shit",
     "pissing",
     "piss pig",
     "pisspig",
     "playboy",
     "pleasure chest",
     "pole smoker",
     "ponyplay",
     "poof",
     "poon",
     "poontang",
     "punany",
     "poop chute",
     "poopchute",
     "porn",
     "porno",
     "pornography",
     "prince albert piercing",
     "pthc",
     "pubes",
     "pussy",
     "queaf",
     "queef",
     "quim",
     "raghead",
     "raging boner",
     "rape",
     "raping",
     "rapist",
     "rectum",
     "reverse cowgirl",
     "rimjob",
     "rimming",
     "rosy palm",
     "rosy palm and her 5 sisters",
     "rusty trombone",
     "sadism",
     "santorum",
     "scat",
     "schlong",
     "scissoring",
     "semen",
     "sex",
     "sexo",
     "sexy",
     "shaved beaver",
     "shaved pussy",
     "shemale",
     "shibari",
     "shit",
     "shota",
     "shrimping",
     "skeet",
     "slanteye",
     "slut",
     "s&m",
     "smut",
     "snatch",
     "snowballing",
     "sodomize",
     "sodomy",
     "spic",
     "splooge",
     "splooge moose",
     "spooge",
     "spread legs",
     "spunk",
     "strap on",
     "strapon",
     "strappado",
     "strip club",
     "style doggy",
     "suck",
     "sucks",
     "suicide girls",
     "sultry women",
     "swastika",
     "swinger",
     "tainted love",
     "taste my",
     "tea bagging",
     "threesome",
     "throating",
     "tied up",
     "tight white",
     "tit",
     "tits",
     "titties",
     "titty",
     "tongue in a",
     "topless",
     "tosser",
     "towelhead",
     "tranny",
     "tribadism",
     "tub girl",
     "tubgirl",
     "tushy",
     "twat",
     "twink",
     "twinkie",
     "two girls one cup",
     "undressing",
     "upskirt",
     "urethra play",
     "urophilia",
     "vagina",
     "venus mound",
     "vibrator",
     "violet wand",
     "vorarephilia",
     "voyeur",
     "vulva",
     "wank",
     "wetback",
     "wet dream",
     "white power",
     "wrapping men",
     "wrinkled starfish",
     "xx",
     "xxx",
     "yaoi",
     "yellow shower",
     "yiffy",
     "zoophilia"]


class GradeViewController: UIViewController {
    
    
    @IBOutlet weak var twitterImage: UIImageView!
    @IBOutlet weak var cannotPost: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var facebookImage: UIImageView!
    @IBOutlet weak var textFromPost: UITextView!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var submit: UIButton!
    
    var copyOfPost: String?
    
    //var score = Grade.sharedInstance
    var newTotal : Double!
    
    static var sharedPost: GradeViewController?
    
    
    override func viewDidLoad() {
        var newString : String!
        newString = copyOfPost
        let count = dictionary.count
        var value = 0
        var autoGrade = 0.00
        
        value = dictionary.map({
            (newString?.lowercaseString.componentsSeparatedByString($0).count)! - 1
        }).reduce(0, combine:+)
        
        
        for index in 0 ..< count {
            if newString.lowercaseString.rangeOfString(dictionary[index]) != nil {
                print("\(dictionary[index]) is a flagged word")
            }
            
        }
        
        print(value)
        
        if value >= 4 {
            autoGrade = 0
        }
        else if value == 3 {
            autoGrade = 25
        }
        else if value == 2 {
            autoGrade = 50
        }
        else if value == 1 {
            autoGrade = 75
        }
        else if value == 0 {
            autoGrade = 100
        }
        
        
        cannotPost.hidden = true
        submit.hidden = false
        textFromPost.text = copyOfPost
        newTotal = autoGrade
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
            newTotal = autoGrade
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
        print("clicked")
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
        print("clicked")
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
    
    @IBAction func anotherTest(sender: AnyObject) {
        print("clicked")
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

