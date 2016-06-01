//
//  PushOneVC.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/30.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

/*
    1.NavDelegate - 拿到对应的动画控制器 或者 交互动画控制器
    2.AnimationTransitionController - 实现AnimationTransitioning 协议，主要是animationTransition:告诉控制器具体动画细节
    3.PersentInteractive - 交互动画控制，主要是根据手势或者声音，脑电波等，updatePersent,cancleInteractive,finishInteractive.
    
    *注意
    1.containerView.addSubView - 需要将参与动画的所有视图加入视图容器中
    2.completeTransition - 提交并告知contenxt动画完成。
*/

import UIKit

class PushOneVC: UIViewController {

//    var navDelegate:CirclePushDelegate? = CirclePushDelegate()
    var interactive : MyPercentInteractive?

    override func viewDidLoad() {
        super.viewDidLoad()
        interactive = MyPercentInteractive(type: TransitionType.Push, direction: Direction.Left, vc: self)
//        self.navigationController?.delegate = navDelegate

        interactive?.config = {[unowned self] in self.push(nil)}
        view.backgroundColor = UIColor.redColor()
        MyButton.shareButton.addTarget(self, action: "push:", forControlEvents: .TouchUpInside)
        view.addSubview(MyButton.shareButton)
    }

    @objc private func push(btn:UIButton?) {

        let vc = POPVC()
        self.navigationController?.delegate = self
        vc.title = "跳进来"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    deinit{
        MyButton.shareButton.removeTarget(self, action: "push:", forControlEvents: .TouchUpInside)
    }
    
}

extension PushOneVC:UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .Pop && fromVC == self {
            return nil
        }
        
        let type:CircleTransitionType = operation == .Push ? CircleTransitionType.NavTransitionPush :CircleTransitionType.NavTransitionPop
        
        return CirclePushAnimationController(type: type)
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive?.interation == true ? interactive : nil;
    }

}

