//
//  YBusinessSetUpVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/27.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YBusinessSetUpVC: YBaseVC,UITableViewDelegate,UITableViewDataSource,YBusinessSetUpViewDelegate{

    var dataArray :Array<Any>? = Array()
    var mainScro:UIScrollView!
    var tableView:UITableView?
    var dataModel:YBusinessModel?
    var suspendView:YBusinessSetUpView!
    var acitivityView:YBusinessSetUpView!
    var normalyView:YBusinessSetUpView!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.title = "营业设置"
        getFetchData()
        creatScroUI()
        // Do any additional setup after loading the view.
    }

    //MARK:-
    //MARK:1.View生命周期
    
    func creatScroUI(){
        mainScro = UIScrollView.init()
        mainScro.backgroundColor = UIColor.hexadecimalColor(hexString: "ececec", alpha: 1.0)
        mainScro.contentSize = CGSize.init(width: KScreenWidth, height: KScreenHeight - CGFloat(KNavBarHeight))
        self.view.addSubview(mainScro)
        mainScro.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.view)
        }
       let nameArr = ["营业状态","预设暂停营业","满减优惠"]
        
        for i in 0 ..< nameArr.count {
        
            
            let view = YBusinessSetUpView.init(frame: CGRect.init(x: 0, y: 10 + CGFloat(i) * 44, width: KScreenWidth, height: 44))
          
            view.nameStr = nameArr[i]
            view.delegate = self
            if i == 0 {
               view.switchStatus = dataModel?.isNormal
                view.switchBtn.tag = 100
                normalyView = view
            }else if i == 1 {
               
                view.switchStatus = dataModel?.isSuspended
                
                if (dataModel?.isSuspended)! {
                    view.frame =  CGRect.init(x: 0, y: 10 + CGFloat(i) * 44, width: KScreenWidth, height: 132)
                  view.addDateView()
                }else{
                    view.frame =  CGRect.init(x: 0, y: 10 + CGFloat(i) * 44, width: KScreenWidth, height: 44)
                }
                view.switchBtn.tag = 101
                suspendView = view
            }else if i == 2 {
                view.switchStatus = dataModel?.isAcitivity
                view.frame = CGRect.init(x: 0, y: suspendView.frame.maxY, width: KScreenWidth, height: 44)
                view.switchBtn.tag = 102
                acitivityView = view
            }
            mainScro.addSubview(view)
        }
    }
    func switchBtnClicked(index: Int, select: Bool) {
        print(index)
        if select {
            //营业状态
            if index == 100 {
             
                //预设暂停营业
            }else if index == 101 {
                suspendView.frame = CGRect.init(x: 0, y:normalyView.frame.maxY, width: KScreenWidth, height: 132)
                acitivityView.frame = CGRect.init(x: 0, y: suspendView.frame.maxY, width: KScreenWidth, height: 44)
                 //满减优惠
            }else if index == 102 {
                
            }
           
         
          
        }else{
           
            if index == 100 {
                
            }else if index == 101 {
               suspendView.frame = CGRect.init(x: 0, y: normalyView.frame.maxY, width: KScreenWidth, height: 44)
                acitivityView.frame = CGRect.init(x: 0, y: suspendView.frame.maxY, width: KScreenWidth, height: 44)
            }else if index == 102 {
                
            }
           
        }
        
        
    }
    func creatTableView(){
        let table = UITableView.init()
        table.register(YBusinessSetUpCell.classForCoder(), forCellReuseIdentifier: "YBusinessSetUpCell")
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        self.view.addSubview(table)
    }
    //MARK:-
    //MARK:2.代理
    //MARK: 系统代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "YBusinessSetUpCell", for: indexPath) as? YBusinessSetUpCell
        
        if cell == nil {
           cell = YBusinessSetUpCell.init(style: .default, reuseIdentifier: "YBusinessSetUpCell")
        }
        
        return cell!
    }
    //MARK: 自定义代理
    
    //MARK:-
    //MARK:3.用户交互
    
    //MARK:-
    //MARK:4.数据处理
    func getFetchData(){
        let dic:[String:Any] = ["isAcitivity":"1","isSuspended":"1","isNormal":"1","suspendStart":"2017-03-26 09:00:00","suspendEnd":"2018-05-31 20:00:00","activities":["money":"100","reduceMoney":"10"]]
        
        let model = YBusinessModel.getBusinessData(dicData: dic)
        self.dataModel = model
        print(model)
        
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
