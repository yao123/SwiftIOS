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
        
        showLeftNacBarItem()
        // Do any additional setup after loading the view.
    }

    //MARK:-
    //MARK:1.View生命周期
    
    func showLeftNacBarItem() {
        
        let count = self.navigationController?.viewControllers.count
        
        if count! > 1 || self.navigationController?.viewControllers.last != self {
            self.setUpLeftNavBarBtn(target: self, action: #selector(backActionVC), imageName: "Nav_LeftBack_icon")
        }else{
            self.navigationItem.hidesBackButton = true
            let nullLeftbar = UIBarButtonItem.init(customView: UIView.init())
            self.navigationItem.leftBarButtonItem = nullLeftbar
        }
    }
    
    //MARK:-
    //MARK:2.代理
    //MARK: 系统代理
    
    //MARK: 自定义代理
    
    //MARK:-
    //MARK:3.用户交互
    @objc func backActionVC() {
        
        if self.navigationController?.viewControllers.last == self {
           self.navigationController?.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }

       
    }
    //MARK:-
    //MARK:4.数据处理
    
    //MARK:-
    //MARK:5.其它
    //自定义左侧导航按钮
    func setUpLeftNavBarBtn(target:Any?,action:Selector,imageName:String){
        let leftBtn = UIButton.init(type: .custom)
        leftBtn.frame = CGRect.init(x: 0, y: 0, width: 20, height: 30)
        leftBtn.setImage(UIImage.init(named: imageName), for: .normal)
        leftBtn.imageView?.contentMode =  UIViewContentMode.scaleAspectFill
        leftBtn.addTarget(target, action: action, for: .touchUpInside)
        let leftBarItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftBarItem
        
    }
    
    //自定义右侧导航按钮
    func setUpRightNavBarBtn(target:Any?,action:Selector,imageName:String){
        let rightBtn = UIButton.init(type: .custom)
        rightBtn.frame = CGRect.init(x: 0, y: 0, width: 40, height: 30)
        rightBtn.setImage(UIImage.init(named: imageName), for: .normal)
        rightBtn.imageView?.contentMode =  UIViewContentMode.scaleAspectFill
        rightBtn.addTarget(target, action: action, for: .touchUpInside)
        let rightBtnBarItem = UIBarButtonItem.init(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = rightBtnBarItem
        
    }
    
    func alertVC(titleStr:String,messageStr:String) {
        let alert = UIAlertController.init(title: titleStr, message: messageStr, preferredStyle: .alert)
        let candelAction = UIAlertAction.init(title: "取消", style: .cancel) { (actoin) in
            print("取消")
        }
        
        let playAction = UIAlertAction.init(title: "确定", style: .default) { (action) in
            print("play")
        }
        alert.addAction(candelAction)
        alert.addAction(playAction)
        self.present(alert, animated: true, completion: nil)
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
