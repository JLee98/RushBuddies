//
//  HomeScreenViewController.swift
//  MySampleApp
//
//  Created by Chaz Clark on 2/25/17.
//
//

import Foundation
import UIKit
import HealthKit
import HealthKitUI

public class HomeScreenViewController: UIViewController{
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if HKHealthStore.isHealthDataAvailable() {
            // add code to use HealthKit here...
            let healthStore = HKHealthStore()
            
        }
    
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
