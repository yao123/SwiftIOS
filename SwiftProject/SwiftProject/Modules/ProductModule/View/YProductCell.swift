//
//  YProductCell.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/15.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YProductCell: UITableViewCell {
    /// 标题
    var productTitle:UILabel?
    var productImage:UIImageView?
    
    var dataModel:YProductModel? {
        didSet {
            productTitle?.text = dataModel?.prouctName
            productImage?.image = UIImage.init(named: (dataModel?.imageName)!)
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
    
    private func setUpUI() {
    
        //产品名称
        let productTitleLabel = UILabel.init()
        productTitleLabel.font = getSystemFont(size: 14.0)
        productTitleLabel.textAlignment = .left
        productTitleLabel.text = "测试"
        productTitleLabel.textColor = UIColor.hexadecimalColor(hexString: "000000", alpha: 1)
        self.contentView.addSubview(productTitleLabel)
        self.productTitle = productTitleLabel
        
        //产品图标
        let productImageView = UIImageView.init()
        self.contentView.addSubview(productImageView)
        productImageView.image = UIImage.init(named: "Product_Coupons_icon")
        self.productImage = productImageView
        
        //箭头图标
        let arrowImage = UIImageView.init()
        arrowImage.image = UIImage.init(named: "Product_RightArrow_icon")
        self.contentView.addSubview(arrowImage)
        
        //分割线
        let lineView = UIView.init()
        lineView.backgroundColor = UIColor.hexadecimalColor(hexString: "ececec", alpha: 1.0)
        self.contentView.addSubview(lineView)
        
        lineView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(self.contentView)
            make.height.equalTo(1)
        }
        
        productImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        productTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(productImageView.snp.right).offset(6)
            make.centerY.equalToSuperview()
        }
        
        arrowImage.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(18)
            make.width.equalTo(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
