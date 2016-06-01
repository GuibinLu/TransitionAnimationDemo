//
//  POPVC.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/31.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

class POPVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyanColor()
        view.userInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //self.navigationController?.delegate = nil
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.navigationController?.popViewControllerAnimated(true)
    }

}
