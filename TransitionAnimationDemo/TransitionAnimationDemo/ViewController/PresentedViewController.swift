//
//  PresentedViewController.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/31.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController{

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        transitioningDelegate = self
        modalPresentationStyle = .Custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.greenColor()
        
    }
    
}



extension PresentedViewController :UIViewControllerTransitioningDelegate{
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self .dismissViewControllerAnimated(true, completion: nil)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CirclePushAnimationController(type: CircleTransitionType.ModalTransitionPresentation)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CirclePushAnimationController(type: CircleTransitionType.ModalTransitionDismissal)
    }
    
    
}