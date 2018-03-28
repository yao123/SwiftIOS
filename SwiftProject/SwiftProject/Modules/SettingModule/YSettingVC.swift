//
//  YSettingVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/13.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YSettingVC: YBaseVC {

    var dataArray:Array<YSettingModel>? = Array()
    override func viewDidLoad() {
        super.viewDidLoad()

        getFetchData()
        creatTableView()
        // Do any additional setup after loading the view.
    }

    //MARK:-
    //MARK:1.View生命周期
    func creatTableView(){
        let settingView = YSsttingView.init(frame: self.view.bounds)
        settingView.dataArray = dataArray
        settingView.controVC = self
        self.view.addSubview(settingView)
    }
    //MARK:-
    //MARK:2.代理
    //MARK: 系统代理
    
    //MARK: 自定义代理
    
    //MARK:-
    //MARK:3.用户交互
    
    //MARK:-
    //MARK:4.数据处理
    func getFetchData(){
        let dataArr = [["name":"商家资料","imageName":"Setting_Merchants_Information_icon"],["name":"营业设置","imageName":"Setting_BusinessSetup_icon"],["name":"消息提醒","imageName":"Setting_MessageRemaind_icon"],["name":"修改密码","imageName":"Setting_ChangePassword_icon"],["name":"注销","imageName":"Setting_Cancellation_icon"]]
        
        for dic in dataArr {
            let model = YSettingModel.getSettingData(dic: dic)
            
            dataArray?.append(model)
        }
    }
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
