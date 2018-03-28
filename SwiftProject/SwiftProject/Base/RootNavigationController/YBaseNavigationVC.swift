//
//  YBaseNavigationVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/13.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YBaseNavigationVC: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        //右滑代理
        self.interactivePopGestureRecognizer?.delegate = self
        UINavigationBar.appearance().barTintColor = UIColor.hexadecimalColor(hexString: "5B90E5", alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count >= 1 {
           viewController.hidesBottomBarWhenPushed = true
        }
        
        super .pushViewController(viewController, animated: animated)
    }
    //MARK:-
    //MARK:系统代理
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    
        return self.viewControllers.count > 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
