//
//  CustomPresentationAnimationController.swift
//  MyCatalogue
//
//  Created by anoopm on 17/07/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CustomPresentationAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        
        return 2.5
        
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        // Get the initial VC
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let finalFrameForVC = transitionContext.finalFrame(for: toVC!)
        let containerView = transitionContext.containerView
        let bounds = UIScreen.main.bounds
        
        toVC!.view.frame = finalFrameForVC.offsetBy(dx: 0, dy: bounds.size.height)
        containerView.addSubview(toVC!.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            fromVC!.view.alpha = 0.5
            toVC!.view.frame = finalFrameForVC
            }, completion: {
                finished in
                transitionContext.completeTransition(true)
                fromVC!.view.alpha = 1.0
        })
    }

}
