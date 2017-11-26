//
//  AMPPedometer.swift
//  MyCatalogue
//
//  Created by anoopm on 16/01/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit
import CoreMotion

class AMPPedometerVC: UIViewController {
    
    @IBOutlet weak var stepCounter:UILabel!
    @IBOutlet weak var activityLabel:UILabel!
    
    let pedometer = CMPedometer()
    
    override func viewDidLoad() {
        
        let defaults = UserDefaults.standard
        var startDate:Date
        if ((defaults.object(forKey: "start")) == nil)
        {
            defaults.set(Date(), forKey: "start")
        }
        startDate = (defaults.object(forKey: "start") as! Date)
        // Check if pedometer is available
        if(CMPedometer.isStepCountingAvailable())
        {
            startDate = (defaults.object(forKey: "start") as! Date)
        self.pedometer.startUpdates(from: defaults.object(forKey: "start") as! Date, withHandler: { (data, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                if(error == nil){
                    self.stepCounter.text = "\(data!.numberOfSteps)"
                }
            })
            })
        }
    }

}
