//
//  ViewController.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/28.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//‚

 /*
目前为止，官方支持以下几种方式的自定义转场：
在 UINavigationController 中 push 和 pop;
在 UITabBarController 中切换 Tab;
Modal 转场：presentation 和 dismissal，俗称视图控制器的模态显示和消失，仅限于modalPresentationStyle属性为 UIModalPresentationFullScreen 或 UIModalPresentationCustom 这两种模式;
UICollectionViewController 的布局转场：UICollectionViewController 与 UINavigationController 结合的转场方式，实现很简单。
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private lazy var dataSource:[String] = {
       return [ "0",
                "1",
                "2" ]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }

    private func initUI() {
        self.title = "转场动画"
        initTableView()
    }
    
    private func initTableView() {
        
        tableView.estimatedRowHeight = 40.0
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
    }
    
    private func initData() {
        
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell")!
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0 :
                navigationController?.pushViewController(PushOneVC(), animated: true)
        case 1 :
            navigationController?.pushViewController(PresentViewController(), animated: true)
        case 2 :
                navigationController?.pushViewController(PresentingOneVC(), animated: true)
            
        default :
            print("default")
        }
    }
    
}

