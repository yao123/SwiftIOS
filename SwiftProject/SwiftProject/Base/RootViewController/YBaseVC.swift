//
//  YBaseVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/13.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    //MARK:-
    //MARK:1.View生命周期
    
    //MARK:-
    //MARK:2.代理
    //MARK: 系统代理
    
    //MARK: 自定义代理
    
    //MARK:-
    //MARK:3.用户交互
    
    //MARK:-
    //MARK:4.数据处理
    
    //MARK:-
    //MARK:5.其它
    //自定义左侧导航按钮
    func setUpLeftNavBarBtn(target:Any?,action:Selector,imageName:String){
        let leftBtn = UIButton.init(type: .custom)
        leftBtn.frame = CGRect.init(x: 0, y: 0, width: 40, height: 30)
        leftBtn.setImage(UIImage.init(named: imageName), for: .normal)
        leftBtn.imageView?.contentMode =  UIViewContentMode.scaleAspectFill
        leftBtn.addTarget(target, action: action, for: .touchUpInside)
        let leftBarItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftBarItem
        
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
