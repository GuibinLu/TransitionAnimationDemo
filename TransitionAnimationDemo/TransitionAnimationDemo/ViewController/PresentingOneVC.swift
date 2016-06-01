//
//  PresentingOneVC.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/31.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

class PresentingOneVC: UIViewController {

    let  presentedDelegate = PresenteDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        presentedDelegate.presentInteractive =  MyPercentInteractive(type: TransitionType.Presente, direction: Direction.Up, vc: self)
        presentedDelegate.presentInteractive?.config = { [unowned self] in self.present(nil)}
    }
    

    
    func initUI() {
        view.backgroundColor = UIColor.greenColor()
        let btn = UIButton(type: .Custom)
        btn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        btn.setTitle("跳转", forState: .Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.backgroundColor = UIColor.orangeColor()
        btn.addTarget(self, action: "present:", forControlEvents: .TouchUpInside)
        view.addSubview(btn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    .FullScreen 的时候，presentingView 的移除和添加由 UIKit 负责，在 presentation 转场结束后被移除，dismissal 转场结束时重新回到原来的位置；
    .Custom 的时候，presentingView 依然由 UIKit 负责，但 presentation 转场结束后不会被移除。
    */
    @objc private func present(btn:UIButton?) {
        let sb = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        let vc  = sb .instantiateViewControllerWithIdentifier("PresentedOneVC")
        vc.modalPresentationStyle = .Custom
   
        vc.transitioningDelegate = presentedDelegate
        
        presentViewController(vc, animated: true, completion: nil)
    }

}



