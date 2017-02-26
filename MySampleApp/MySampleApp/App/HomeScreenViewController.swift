//
//  HomeScreenViewController.swift
//  MySampleApp
//
//  Created by Chaz Clark on 2/25/17.
//
//

import Foundation
import UIKit
import CoreLocation

import HealthKit
import HealthKitUI

public class HomeScreenViewController:  UIViewController{
    @IBOutlet weak var explanationTextView: UITextView!
    @IBOutlet weak var stepTextBox: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var steps = " "
    steps = t
    
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
