//
//  YBusinessSetUpCell.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/27.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YBusinessSetUpCell: UITableViewCell {

    /// 名称
    var nameLabel:UILabel!
    /// 状态按钮
    var switchBtn:UIButton!
    /// 加
    var addBtn:UIButton!
    /// 减
    var reduceBtn:UIButton!
    /// 日期
    var dateLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setUpUI(){
       
        //产品名称
        let nameLabel = UILabel.init()
        nameLabel.font = getSystemFont(size: 14.0)
        nameLabel.textAlignment = .left
        nameLabel.text = "测试"
        nameLabel.textColor = UIColor.hexadecimalColor(hexString: "000000", alpha: 1)
        self.contentView.addSubview(nameLabel)
        self.nameLabel = nameLabel
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        
        let btn = UIButton.init(type: .custom)
         btn.setImage(UIImage.init(named: "BuniessSetUp_Open_icon"), for: .normal)
         self.contentView.addSubview(btn)
        self.switchBtn = btn
        btn.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10)
            make.centerY .equalTo(self.contentView)
            make.width.equalTo(70)
            make.height.equalTo(40)
        }
        
        
        //日期
        let dateLabel = UILabel.init()
        dateLabel.font = getSystemFont(size: 14.0)
        dateLabel.textAlignment = .left
        dateLabel.text = "测试"
        dateLabel.textColor = UIColor.hexadecimalColor(hexString: "000000", alpha: 1)
        self.contentView.addSubview(dateLabel)  //产品名称
        self.dateLabel = dateLabel
        dateLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10)
            make.centerY .equalTo(self.contentView)
            make.width.equalTo(130)
            make.height.equalTo(20)
        }
        
        
        let addBtn = UIButton.init(type: .custom)
        addBtn.setImage(UIImage.init(named: "Setting_Add_icon"), for: .normal)
        self.contentView.addSubview(addBtn)
        self.addBtn = addBtn
        addBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        
        let reduceBtn = UIButton.init(type: .custom)
        reduceBtn.setImage(UIImage.init(named: "Setting_Clean_icon"), for: .normal)
        self.contentView.addSubview(reduceBtn)
        self.reduceBtn = reduceBtn
        reduceBtn.snp.makeConstraints { (make) in
            make.right.equalTo(addBtn.snp.left).offset(-10)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
