//
//  SharingVC.swift
//  MyCatalogue
//
//  Created by anoopm on 28/08/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import Foundation
import UIKit
import Social

class SharingVC: UIViewController {
    
    @IBOutlet fileprivate weak var imageViewToPost:UIImageView!
    @IBOutlet fileprivate weak var shareButton:UIButton!
    @IBOutlet fileprivate weak var faceBookButton:UIButton!
    @IBOutlet fileprivate weak var twitterButton:UIButton!
    
    
    @IBAction func shareAction(_ sender: AnyObject){
        
        let button = sender as! UIButton
            
        shareButtonTappedWith(button.tag)

    }
    
    fileprivate func shareButtonTappedWith(_ type: Int)->Void{
        
        switch type {
        //face book
        case 2:
            fbShare()
        case 3:
            twitterShare()
        case 1:
            shareActivity()
        default:break
            
        }
    }
    
    fileprivate func shareActivity(){
        
        let vc = UIActivityViewController(activityItems: [imageViewToPost.image!], applicationActivities: [])
        
        vc.popoverPresentationController?.sourceView = self.view
        vc.popoverPresentationController?.sourceRect = shareButton.frame
        
        present(vc, animated: true) { 
            
        }
    }
    
    fileprivate func fbShare(){
        
        let fbComposerVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        fbComposerVC?.add(imageViewToPost.image!)
        fbComposerVC?.setInitialText("It is a great Picture")
        present(fbComposerVC!, animated: true) { 
            
        }
    }
    
    fileprivate func twitterShare(){
        
        let twitterComposerVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitterComposerVC?.add(imageViewToPost.image!)
        twitterComposerVC?.setInitialText("It is a great Picture")
        present(twitterComposerVC!, animated: true) {
            
        }
    }
}
