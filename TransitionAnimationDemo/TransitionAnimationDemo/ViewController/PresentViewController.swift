//
//  PresentViewController.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/31.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orangeColor()
        view.addSubview(MyButton.shareButton)
        MyButton.shareButton.addTarget(self, action: "present:", forControlEvents: .TouchUpInside)
    }

    
    @objc private func present(btn:UIButton) {
        self .presentViewController(PresentedViewController(), animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit{
        MyButton.shareButton .removeTarget(self, action: "present:", forControlEvents: .TouchUpInside)
    }

}
