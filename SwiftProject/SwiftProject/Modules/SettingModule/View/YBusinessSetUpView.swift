//
//  YBusinessSetUpView.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/27.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

protocol YBusinessSetUpViewDelegate:NSObjectProtocol {
    func switchBtnClicked(index:Int,select:Bool) -> ()
}

class YBusinessSetUpView: UIView {

    /// 名称
    var nameLabel:UILabel!
    /// 状态按钮
    var switchBtn:UIButton!
  
    var delegate:YBusinessSetUpViewDelegate?
    /// 日期
    var dateLabel:UILabel!
    
    var mainView:UIView!
    
    /// 日期view
    var dateView:UIView?
    
    var nameStr:String? {
        didSet {
            nameLabel.text = nameStr
            
        }
    }
    
    var switchStatus:Bool? {
        didSet{
            if switchStatus! {
              switchBtn.setImage(UIImage.init(named: "BuniessSetUp_Open_icon"), for: .normal)
              switchBtn.isSelected = true
            }else{
              switchBtn.setImage(UIImage.init(named: "BuniessSetUp_Close_icon"), for: .normal)
                 switchBtn.isSelected = false
            }
           
        }
    }
    
    var model:YBusinessModel? {
        
        didSet{
            //是否营业状态
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
         setUpUI()
    }
    
     func setUpUI(){
        
        mainView = UIView.init()
        mainView.backgroundColor = UIColor.white
        self.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(44)
        }
        //产品名称
        let nameLabel = UILabel.init()
        nameLabel.font = getSystemFont(size: 14.0)
        nameLabel.textAlignment = .left
        nameLabel.text = "测试"
        nameLabel.textColor = UIColor.hexadecimalColor(hexString: "000000", alpha: 1)
        mainView.addSubview(nameLabel)
        self.nameLabel = nameLabel
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(mainView).offset(10)
            make.centerY.equalTo(mainView)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage.init(named: "BuniessSetUp_Open_icon"), for: .normal)
        btn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        mainView.addSubview(btn)
        self.switchBtn = btn
        btn.snp.makeConstraints { (make) in
            make.right.equalTo(mainView).offset(-10)
            make.centerY .equalTo(mainView)
            make.width.equalTo(70)
            make.height.equalTo(40)
        }
        
        
        //分割线
        let lineView = UIView.init()
        lineView.backgroundColor = UIColor.hexadecimalColor(hexString: "ececec", alpha: 1.0)
        mainView.addSubview(lineView)
      
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(mainView)
            make.top.equalTo(mainView).offset(43
            )
            make.height.equalTo(1)
        }
    }
    
    
    func addDateView(){
        
        let dateView = UIView.init()
        dateView.backgroundColor = UIColor.white
        self.addSubview(dateView)
        self.dateView = dateView
        dateView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self)
            make.left.right.equalTo(self)
            make.top.equalTo(self).offset(44)
        }
       //开始时间
        
        let begainNameLabel = UILabel.init()
        begainNameLabel.text = "开始时间:"
        begainNameLabel.textColor = UIColor.hexadecimalColor(hexString: "b2b2b2", alpha: 1.0)
        begainNameLabel.textAlignment = .left
        begainNameLabel.font = UIFont.systemFont(ofSize: 14.0)
        dateView.addSubview(begainNameLabel)
        begainNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(dateView).offset(10)
            make.width.equalTo(130)
            make.centerY.equalTo(dateView).offset(-22)
        }
        
        let begaindateLabel = UILabel.init()
        begaindateLabel.text = "2018-03-27 09:00"
        begaindateLabel.textColor = UIColor.hexadecimalColor(hexString: "000000", alpha: 1.0)
        begaindateLabel.textAlignment = .left
        begaindateLabel.font = UIFont.systemFont(ofSize: 14.0)
        dateView.addSubview(begaindateLabel)
        begaindateLabel.snp.makeConstraints { (make) in
            make.right.equalTo(dateView).offset(-10)
            make.width.equalTo(130)
            make.centerY.equalTo(dateView).offset(-22)
        }
        
        let begainlineView = UIView.init()
        begainlineView.backgroundColor = UIColor.hexadecimalColor(hexString: "ececec", alpha: 1.0)
        dateView.addSubview(begainlineView)
        begainlineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(dateView)
            make.centerY.equalTo(dateView).offset(-1)
            make.height.equalTo(1)
        }
        
        //结束时间
        let endNameLabel = UILabel.init()
        endNameLabel.text = "结束时间:"
        endNameLabel.textColor = UIColor.hexadecimalColor(hexString: "b2b2b2", alpha: 1.0)
        endNameLabel.textAlignment = .left
        endNameLabel.font = UIFont.systemFont(ofSize: 14.0)
        dateView.addSubview(endNameLabel)
        endNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(dateView).offset(10)
            make.width.equalTo(130)
            make.centerY.equalTo(dateView).offset(22)
        }
        
        let enddateLabel = UILabel.init()
        enddateLabel.text = "2018-05-27 09:00"
        enddateLabel.textColor = UIColor.hexadecimalColor(hexString: "000000", alpha: 1.0)
        enddateLabel.textAlignment = .left
        enddateLabel.font = UIFont.systemFont(ofSize: 14.0)
        dateView.addSubview(enddateLabel)
        enddateLabel.snp.makeConstraints { (make) in
            make.right.equalTo(dateView).offset(-10)
            make.width.equalTo(130)
            make.centerY.equalTo(dateView).offset(22)
        }
        
        let endlineView = UIView.init()
        endlineView.backgroundColor = UIColor.hexadecimalColor(hexString: "ececec", alpha: 1.0)
        dateView.addSubview(endlineView)
        
        endlineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(dateView)
            make.top.equalTo(dateView.snp.bottom).offset(-1)
            make.height.equalTo(1)
        }
    }
    
    func removeDateView() {
        self.dateView?.removeFromSuperview()
        self.dateView = nil
    }
    
    @objc func btnAction(sender:UIButton){
        if sender.isSelected {
           switchBtn.setImage(UIImage.init(named: "BuniessSetUp_Close_icon"), for: .normal)
             sender.isSelected = false
           
        }else{
            switchBtn.setImage(UIImage.init(named: "BuniessSetUp_Open_icon"), for: .normal)
             sender.isSelected = true
          
        }
        
            guard self.delegate != nil else {
                return
                
            }
            self.delegate!.switchBtnClicked(index: sender.tag, select: sender.isSelected)
         if nameStr == "预设暂停营业" {
          
            if sender.isSelected {
                addDateView()
            }else{
                removeDateView()
            }
        }        
       
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
