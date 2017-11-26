//
//  CustomTransitionDetailsViewController.swift
//  MyCatalogue
//
//  Created by anoopm on 17/07/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CustomTransitionDetailsViewController: UIViewController {
    
    @IBOutlet fileprivate weak var starLabel:UILabel!
    @IBOutlet fileprivate weak var starLabelFull:UILabel!
    @IBOutlet fileprivate weak var starLabelZero:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

//        starLabel.attributedText = NSMutableAttributedString().starWithRating(3.5, outOfTotal: 5, withFontSize: 8.0)
//        starLabelFull.attributedText = NSMutableAttributedString().starWithRating(5, outOfTotal: 5, withFontSize: 8.0)
//        starLabelZero.attributedText = NSMutableAttributedString().starWithRating(0, outOfTotal: 5, withFontSize: 8.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(){
        
        self.dismiss(animated: true) { () -> Void in
            
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
