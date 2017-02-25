//
//  MainViewController.swift
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.10
//

import UIKit
import AWSMobileHubHelper

class MainViewController: UITableViewController {
    
    var demoFeatures: [DemoFeature] = []
    var signInObserver: AnyObject!
    var signOutObserver: AnyObject!
    fileprivate let loginButton: UIBarButtonItem = UIBarButtonItem(title: nil, style: .done, target: nil, action: nil)
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        // Default theme settings.
        navigationController!.navigationBar.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = UIColor(red: 0xF5/255.0, green: 0x85/255.0, blue: 0x35/255.0, alpha: 1.0)
        navigationController!.navigationBar.tintColor = UIColor.white

            presentSignInViewController()
        
        var demoFeature = DemoFeature.init(
            name: NSLocalizedString("User Sign-in",
                comment: "Label for demo menu option."),
            detail: NSLocalizedString("Enable user login with popular 3rd party providers.",
                comment: "Description for demo menu option."),
            icon: "UserIdentityIcon", storyboard: "UserIdentity")
        
        demoFeatures.append(demoFeature)
        
        demoFeature = DemoFeature.init(
            name: NSLocalizedString("NoSQL",
                comment: "Label for demo menu option."),
            detail: NSLocalizedString("Store data in the cloud.",
                comment: "Description for demo menu option."),
            icon: "NoSQLIcon", storyboard: "NoSQLDatabase")
        
        demoFeatures.append(demoFeature)

                signInObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.AWSIdentityManagerDidSignIn, object: AWSIdentityManager.default(), queue: OperationQueue.main, using: {[weak self] (note: Notification) -> Void in
                        guard let strongSelf = self else { return }
                        print("Sign In Observer observed sign in.")
                        strongSelf.setupRightBarButtonItem()
                })
                
                signOutObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.AWSIdentityManagerDidSignOut, object: AWSIdentityManager.default(), queue: OperationQueue.main, using: {[weak self](note: Notification) -> Void in
                        guard let strongSelf = self else { return }
                        print("Sign Out Observer observed sign out.")
                        strongSelf.setupRightBarButtonItem()
                })
                
                setupRightBarButtonItem()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(signInObserver)
        NotificationCenter.default.removeObserver(signOutObserver)
    }

    func setupRightBarButtonItem() {
            navigationItem.rightBarButtonItem = loginButton
            navigationItem.rightBarButtonItem!.target = self
            
            if (AWSIdentityManager.default().isLoggedIn) {
                navigationItem.rightBarButtonItem!.title = NSLocalizedString("Sign-Out", comment: "Label for the logout button.")
                navigationItem.rightBarButtonItem!.action = #selector(MainViewController.handleLogout)
            }
    }
    
    func presentSignInViewController() {
        if !AWSIdentityManager.default().isLoggedIn {
            let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "SignIn")
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - UITableViewController delegates
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainViewCell")!
        let demoFeature = demoFeatures[indexPath.row]
        cell.imageView!.image = UIImage(named: demoFeature.icon)
        cell.textLabel!.text = demoFeature.displayName
        cell.detailTextLabel!.text = demoFeature.detailText
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoFeatures.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let demoFeature = demoFeatures[indexPath.row]
        let storyboard = UIStoryboard(name: demoFeature.storyboard, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: demoFeature.storyboard)
        self.navigationController!.pushViewController(viewController, animated: true)
    }

    
    
    func handleLogout() {
        if (AWSIdentityManager.default().isLoggedIn) {
            AWSIdentityManager.default().logout(completionHandler: {(result: Any?, error: Error?) in
                self.navigationController!.popToRootViewController(animated: false)
                self.setupRightBarButtonItem()
                    self.presentSignInViewController()
            })
            // print("Logout Successful: \(signInProvider.getDisplayName)");
        } else {
            assert(false)
        }
    }
}

class FeatureDescriptionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "Back", style: .plain, target: nil, action: nil)
    }
}
