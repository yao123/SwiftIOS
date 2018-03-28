
//
//  YOrderCell.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/14.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YOrderCell: UITableViewCell {

    /// 测试属性 名称
    var titleLabel:UILabel?
    
    /*
    private var nameStr:String?
    
    var nameStrValue:String?{
        
        set {
            nameStr = newValue
            titleLabel?.text = nameStr
        }
        get {
          
            return nameStr
        }
        
    }
    */
    var labelName:String? {
        didSet {
           titleLabel?.text = labelName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    //MARK:创建ui
    
   private func setUpUI() {
        let label:UILabel = UILabel.init()
        label.text = "测试"
        label.textColor = UIColor.red
        label.textAlignment = .center
        titleLabel = label
        self.contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.center.equalToSuperview()
        }
    
     let lineView = UIView.init()
    
     lineView.backgroundColor = UIColor.hexadecimalColor(hexString: "ececec", alpha: 1.0)
    
    self.contentView.addSubview(lineView)
    
    lineView.snp.makeConstraints { (make) in
        make.bottom.left.right.equalTo(self.contentView)
        make.height.equalTo(1)
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
