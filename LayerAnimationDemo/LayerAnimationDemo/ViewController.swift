//
//  ViewController.swift
//  LayerAnimationDemo
//
//  Created by 路贵斌 on 16/5/31.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var bgView: UIView!
    var b: Bool = false
    
    private lazy var maskLayer :CAShapeLayer = {
       let layer = CAShapeLayer()
        layer.contentsScale = UIScreen.mainScreen().scale
        layer.fillColor = UIColor.whiteColor().CGColor
        let bezier = UIBezierPath(ovalInRect: CGRect(x: -200, y:-200, width: 1000, height: 1500))
        layer.path = bezier.CGPath
        layer.strokeColor = UIColor.blackColor().CGColor
        layer.borderWidth = 1.0
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 75.0
        bgView.layer.mask = maskLayer
        //testLayerAnimation()
    }

    func testLayerAnimation() {
        b = !b
        let bigPath = UIBezierPath(ovalInRect: CGRect(x: -200, y:-200, width: 1000, height: 1500))
        let smallPath = UIBezierPath(ovalInRect: CGRect(x: 100, y: 100, width: 150, height: 150))
        
        maskLayer.path = b == true ? bigPath.CGPath : smallPath.CGPath
    
        //UIView失效
        let animation = CABasicAnimation(keyPath: "path")
        animation.fillMode = kCAFillModeBoth
        animation.duration = 2.0
        animation.fromValue = b == true ? smallPath.CGPath : bigPath.CGPath
        animation.toValue = b == true ? bigPath.CGPath : smallPath.CGPath
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        maskLayer.addAnimation(animation, forKey: "path")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        testLayerAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

