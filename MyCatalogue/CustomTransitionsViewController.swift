//
//  CustomTransitionsViewController.swift
//  MyCatalogue
//
//  Created by anoopm on 15/07/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CustomTransitionsViewController: UIViewController,UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    let customPresentationAnimationController = CustomPresentationAnimationController()
    let customDismissAnimationController = CustomDismissAnimationController()
    let custom3DAnimationController = Custom3DAnimationController()
    // Get menu from plist
    let menuArray = Utilities.sharedUtilities.getMenuArrayFromPlistFor(identifier: "CustomTransitions")
    
    @IBOutlet fileprivate weak var menuTableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TransitionCell", for: indexPath)
    
    // Configure the cell...
        cell.textLabel!.text = menuArray[(indexPath as NSIndexPath).row]
    
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath){
        let selectedItem = menuArray[(indexPath as NSIndexPath).row]
        self.performSegue(withIdentifier: selectedItem, sender: self)
    }
    // MARK: Navigation AnimationController
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        custom3DAnimationController.reverse = operation == .pop
        
        return custom3DAnimationController
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Bounce"{
            
            let toViewController = segue.destination as UIViewController
            toViewController.transitioningDelegate = self
        }
        else if segue.identifier == "3DRotation"{
            
//            let toViewController = segue.destinationViewController as UIViewController
//            
//            self.navigationController?.pushViewController(toViewController, animated: true)
        }
        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentationAnimationController
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customDismissAnimationController
    }
    

}
