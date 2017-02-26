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

public class HomeScreenViewController:  UIViewController{
   
    let healthStore = HKHealthStore()
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
//   let storage = HKHealthStore()
//    //   Define the Step Quantity Type
//    let stepsCount = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
//    
//    //   Get the start of the day
//    let date = NSDate()
//    let cal = Calendar(identifier: Calendar.Identifier.gregorian)
//    let newDate = cal.startOfDay(for: date as Date)
//    
//    //  Set the Predicates & Interval
//    let predicate = HKQuery.predicateForSamples(withStart: newDate as Date, end: NSDate() as Date, options: .strictStartDate)
//    let interval: NSDateComponents = NSDateComponents()
//    
//    interval.day = 1
//    
//    //  Perform the Query
//    let query = HKStatisticsCollectionQuery(quantityType: stepsCount!, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: newDate as Date, intervalComponents:interval as DateComponents)
//    
//    
//    query.initialResultsHandler = { query, results, error in
//    
//    if error != nil {
//    
//    //  Something went Wrong
//    return
//    }
//    
//    if let myResults = results{
//    myResults.enumerateStatistics(from: self.yesterday as Date, to: self.today as Date) {
//    statistics, stop in
//    
//    if let quantity = statistics.sumQuantity() {
//    
//    let steps = quantity.doubleValue(for: HKUnit.count())
//    
//    print("Steps = \(steps)")
//    completion(stepRetrieved: steps)
//    
//    }
//    }
//    }
//    
//    
//    }
//    
//    storage.execute(query)
//    
//    
//    
//}

//    init()
//    {
//        checkAuthorization()
//    }
//
//    func checkAuthorization() -> Bool {}
//    func recentSteps(completion: @escaping (Double, NSError?) -> () ){}
//        
//    }
//    
//    func checkAuthorization() -> Bool
//    {
//        var isEnabled = true
//        
//        if HKHealthStore.isHealthDataAvailable()
//        {
//            let steps = NSSet(object: HKQuantityType.quantityType(forIdentifierStepCount))
//            
//            
//            storage.requestAuthorization(toShare: nil, read: steps) { (success, error) -> Void in
//                isEnabled = success
//            }
//        }
//        else{
//            isEnabled = false
//        }
//return isEnabled
//    }
//    func recentSteps(completion: @escaping (Double, NSError?) -> () )
//    {
//        let type = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
//        let predicate = HKQuery.predicateForSampleWithStartDate(NSDate() - 1.day, endDate: NSDate(), options: .None)
//        let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: 0, sortDescriptors: nil){ query, results, error in
//            var steps: Double = 0
//            if results?.count > 0{
//                for result in results as [HKQuantitySample]
//                {
//                    steps += result.quantity.doubleValueForUnit(HKUnit.countUnit())
//                }
//            }
//            completion(steps, error)
//    }
//        storage.executeQuery(query)
//}

//    func checkAvailability() -> Bool {
//        var isAvailable = true
//        
//        if HKHealthStore.isHealthDataAvailable(){
//
//        print("HealthApp data is availible")
//        
//        let stepsCount = NSSet(object: HKQuantityType.quantityType.ForIdentifier( HKQuantityTypeIdentifierStepCount))
//            
//        healthStore.requestAuthorizationToShareTypes(shareObjects as Set<NSObject> readTypes: stepsCount as Set<NSObject)<#T##(Bool, Error?) -> Void#> in
//            isAvailable = success
//    }
//        else
//        {
//            isAvailable = false
//            print("HealthApp data is NOT available on this device.")
//        }
//        return isAvailable
//}
}
