//
//  YMessageVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/13.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YMessageVC: YBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        YBaseModel.shareModel.sss(m: .reduce)
        YBaseModel.shareBaseModel.storageUserDefaults(key: "userName", value: "yao")
        print(YBaseModel.shareBaseModel.takeOutStorageUserDefaults(key: "userName"))
        YBaseModel.shareBaseModel.delegateStorageUserDefaults(key: "userName")
    
    }

  
    //MARK:-
    //MARK:1.View生命周期
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if YBaseModel.shareBaseModel.isJudgeEmptyStorageUserDegaults(key: "userName") {
            print("删除了")
        }
     
    }
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
