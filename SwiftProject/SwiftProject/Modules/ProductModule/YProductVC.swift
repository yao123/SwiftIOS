//
//  YProductVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/13.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YProductVC: YBaseVC,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    
    var dataArray:Array<YProductModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dicArray = [["prouctName":"商品管理","imageName":"Product_GoodsManagement_icon"],
                        ["prouctName":"商品分类","imageName":"Product_GoodsClassification_icon"],
                        ["prouctName":"商品规格","imageName":"Product_GoodsSpecifications_icon"],
                        ["prouctName":"服务管理","imageName":"Product_ServiceManagement_icon"],
                        ["prouctName":"服务分类","imageName":"Product_ServiceClassification_icon"],
                        ["prouctName":"优惠/验券","imageName":"Product_Coupons_icon"]]
         
        for dic in dicArray {
            let model = YProductModel.getProductModelData(dic: dic)
            dataArray.append(model)

        }
        creatTableViewUI()
        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        tableView.contentInset = UIEdgeInsets.zero
//        tableView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    //MARK:-
    //MARK:1.View生命周期
    
    func creatTableViewUI() {
        
       tableView = UITableView.init()
       tableView.backgroundColor = UIColor.white
       tableView.rowHeight = 44
       tableView.register(YProductCell.classForCoder(), forCellReuseIdentifier: "YProductCell")
       tableView.dataSource = self
       tableView.delegate = self
       tableView.separatorStyle = .none
       self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
            
        }
        
       /* qq
         let qqHeader = QQStyleRefreshHeader()
        tableView.gtm_addRefreshHeaderView(refreshHeader: qqHeader) { [weak self] in
            guard let weakSelf = self else {
                return
            }
            weakSelf.headerFresh()
        };
//        tableView.triggerRefreshing()
 */
    }
    
    func headerFresh() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [weak self] in
           
            guard let weakself = self  else {
                return
            }
            
            weakself.tableView.endRefreshing(isSuccess: true)
        }
    }
    //MARK:-
    //MARK:2.代理
    //MARK: 系统代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       var cell = tableView.dequeueReusableCell(withIdentifier: "YProductCell", for: indexPath) as? YProductCell
        if cell == nil {
            cell = YProductCell.init(style: .default, reuseIdentifier: "YProductCell")
        }
        let model:YProductModel = dataArray[indexPath.row]
        cell?.dataModel = model
        cell?.selectionStyle = .none
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
    }
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
