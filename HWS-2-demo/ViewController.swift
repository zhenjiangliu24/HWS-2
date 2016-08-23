//
//  ViewController.swift
//  HWS-2-demo
//
//  Created by ZhongZhongzhong on 2016-08-20.
//  Copyright © 2016 ZhongZhongzhong. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 2.0
        button2.layer.borderWidth = 2.0
        button3.layer.borderWidth = 2.0
        
        button1.layer.borderColor = UIColor.grayColor().CGColor
        button2.layer.borderColor = UIColor.grayColor().CGColor
        button3.layer.borderColor = UIColor.grayColor().CGColor
        
        askQuestion(nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        
        title = countries[correctAnswer].uppercaseString
    }

    @IBAction func buttonClicked(sender: AnyObject) {
        var title: String
        
        if sender.tag==correctAnswer {
            title = "Correct"
            score += 1
        }else{
            title = "Wrong"
            score -= 1
        }
        
        let alertVC = UIAlertController(title: title, message: "Your score is\(score)", preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        
        presentViewController(alertVC, animated: true, completion: nil)
    }
    

}

