//
//  CustomDismissAnimationController.swift
//  MyCatalogue
//
//  Created by anoopm on 17/07/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CustomDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        
        return 2
        
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        // Get the initial VC
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let finalFrameForVC = transitionContext.finalFrame(for: toVC!)
        let containerView = transitionContext.containerView
        toVC?.view.frame = finalFrameForVC
        containerView.addSubview((toVC?.view)!)
        toVC?.view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            fromVC!.view.alpha = 0.5
            toVC?.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            //toVC!.view.frame = finalFrameForVC
            }, completion: {
                finished in
                transitionContext.completeTransition(true)
                fromVC!.view.alpha = 1.0
        })
    }
}
