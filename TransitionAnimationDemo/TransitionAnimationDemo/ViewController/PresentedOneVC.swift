//
//  PresentedOneVC.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/31.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

class PresentedOneVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBOutlet weak var textFWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (self.transitioningDelegate as! PresenteDelegate) .dismissInteractive = MyPercentInteractive(type: TransitionType.Dismiss, direction: Direction.Down, vc: self)
    }

    override func viewDidAppear(animated: Bool) {
        self.textFWidth!.constant = 200.0
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.closeBtn.hidden = false
            self.textField.layoutIfNeeded()
            }, completion: nil)
    }
    
    @IBAction func close(sender: UIButton) {
        
        var transform = CGAffineTransformMakeRotation(3 * CGFloat(M_PI))
        transform = CGAffineTransformScale(transform, 0.1, 0.1)
        textFWidth!.constant = 0.0
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.closeBtn.transform = transform
            self.textField.layoutIfNeeded()
            }) { (_) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}
