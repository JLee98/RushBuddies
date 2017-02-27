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
    var steps = 0
    var stringSteps = ""
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = HKHealthStore()
        
        
        //   Define the Step Quantity Type
        let stepsCount = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
        
        //   Get the start of the day
        let date = NSDate()
        let cal = NSCalendar.current
        let newDate = cal.startOfDay(for: date as Date)
        
        //  Set the Predicates & Interval
        let predicate = HKQuery.predicateForSamples(withStart: newDate as Date, end: NSDate() as Date, options: .strictStartDate)
        let interval: NSDateComponents = NSDateComponents()
        
        interval.day = 1
        
        //  Perform the Query
        let query = HKStatisticsCollectionQuery(quantityType: stepsCount!, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: newDate as Date, intervalComponents:interval as DateComponents)
        
        
        query.initialResultsHandler = { query, results, error in
            
            if error != nil {
                
                //  Something went Wrong
                return
            }
            
            if let myResults = results{
                myResults.enumerateStatistics(from: cal.date(byAdding: .day, value: -1, to: Date())! as Date, to: date as Date) {
                    statistics, stop in
                    
                    if let quantity = statistics.sumQuantity() {
                        
                        let steps = quantity.doubleValue(for: HKUnit.count())
                        
                        print("Steps = \(steps)")
                        //completion(stepRetrieved: steps)
                        
                    }
                }
            }
        }
        
        //func checkAuthorization() -> Bool
        //        {
        //            var isEnabled = true
        //
        if HKHealthStore.isHealthDataAvailable()
        {
            //let steps = NSSet(object: HKQuantityType.quantityType(forIdentifierStepCount))
            
            storage.requestAuthorization(toShare: nil, read: Set(arrayLiteral: HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!)){ (success, error) -> Void in
                //isEnabled = success
            }
        }
        else{
            //isEnabled = false
        }
        //            return isEnabled
        //        }
        
        
        storage.execute(query)
        
        //
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func enterAction(_ sender: Any) {
        steps = Int(stepTextBox.text!)!
    }
    
    public func returnSteps() -> Int {
        return steps
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



    


    
