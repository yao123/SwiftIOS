//
//  YSsttingView.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/26.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YSsttingView: UIView,UITableViewDelegate,UITableViewDataSource {

    var dataArray:Array<Any>? = Array() 
    var tableView:UITableView!
    var controVC:YBaseVC?
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatTableView()
    }

    func creatTableView(){
        tableView = UITableView.init()
        tableView.register(YSettingCell.classForCoder(), forCellReuseIdentifier: "YSettingCell")
        tableView.estimatedRowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var cell = tableView.dequeueReusableCell(withIdentifier: "YSettingCell", for: indexPath) as? YSettingCell
        
        if cell == nil {
            cell = YSettingCell.init(style: .default, reuseIdentifier: "YSettingCell")
        }
        if (dataArray?.count)! > 0 {
             cell?.dataModel = dataArray?[indexPath.row] as? YSettingModel
        }
       cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
          controVC?.navigationController?.pushViewController(YBusinessSetUpVC(), animated: true)
        }else{
           controVC?.navigationController?.pushViewController(YMessageRemaindVC(), animated: true)
        }
    }
    required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
    }
}
