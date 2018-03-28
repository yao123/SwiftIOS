//
//  YOrderVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/13.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit
import SwiftFCXRefresh
import Chrysan
class YOrderVC: YBaseVC,UITableViewDelegate,UITableViewDataSource,YTestVCDelegate {

    var tableView:UITableView!
    
    /// 下拉刷新
    var headerRefreshView: FCXRefreshHeaderView?
    /// 上拉加载
    var footerRefreshView: FCXRefreshFooterView?
    let identifierStr = "YOrderCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NotificationCenter.default.addObserver(self, selector: #selector(notification(sender:)), name: NSNotification.Name(rawValue: "TestNoification"), object: nil)
        
        creatTableViewUI()
        // Do any additional setup after loading the view.
    }

    //MARK:-
    //MARK:1.View生命周期
    
    //MARK:创建tableview
    func creatTableViewUI() {
       tableView = UITableView.init()
      
        tableView.register(YOrderCell.classForCoder(), forCellReuseIdentifier: identifierStr)
        tableView.backgroundColor = BgViewColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)

        }
        /*
         转圈提示
        chrysan.showMessage("正在加载")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            [weak self] in
            guard let weakSelf = self else {
                return
            }
           weakSelf.chrysan.hide()
        }
      */
        addRefreshView()
 
    }

    //MARK:添加上下拉刷新
    func addRefreshView() {
        //[weak self] 表示 () 中的所有 self 都为弱引用
        headerRefreshView = tableView.addFCXRefreshHeader(handler: { [weak self](refreshHeader) in
            self?.refreshHeaderAction()
        })
        
        footerRefreshView = tableView.addFCXRefreshFooter(handler: {  [weak self](refreshHeader) in
            self?.refreshFooterAction()
        })
    }
    
    func refreshHeaderAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {   [weak self] in
          
            guard let weakSelf = self else {
                return
            }
            print("下拉刷新")
            //做数据处理
            weakSelf.headerRefreshView?.endRefresh()
            weakSelf.tableView.reloadData()
            
        }
    }
    
    func refreshFooterAction() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {  [weak self] in
          
            guard let weakSelf = self else {
                return
            }
            
            print("上拉加载")
            //做数据处理
            
            weakSelf.footerRefreshView?.endRefresh()
        }
        
    }
    //MARK:-
    //MARK:2.代理
    //MARK: 系统代理
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifierStr, for: indexPath) as? YOrderCell
        if cell == nil {
            cell = YOrderCell.init(style: .default, reuseIdentifier: identifierStr)
        }
        cell?.selectionStyle = .none
        cell?.labelName = String.init(format: "%d", indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let testVC = YTestVC()
        testVC.deelgate = self
        testVC.block = { (str) in
            
            print("aaaaa"+str)
            
        }
        testVC.nameBlock = {
            
        }
       
        self.navigationController?.pushViewController(testVC, animated: true)
        
    }
    //MARK: 自定义代理
    //MARK: YTestDelegate
    func testMethodOne() {
        print("无参数代理方法")
    }
    
    func testMethodTwo(str: String) {
        print("有参数代理方法=" + str)
    }
    
    //MARK:-
    //MARK:3.用户交互
    
    //MARK:-
    //MARK:4.数据处理
    
    @objc func notification(sender:Notification) {
        print("通知中心")
    }
    
    //MARK:-
    //MARK:5.其它
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("控制器销毁执行")
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
