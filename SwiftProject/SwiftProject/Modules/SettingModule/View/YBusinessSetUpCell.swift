//
//  YBusinessSetUpCell.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/27.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

protocol YBusinessCellDelegate:NSObjectProtocol {
    func addBtnAction(index:Int) -> ()
    func reduceBtnAction(index:Int) -> ()
}

class YBusinessSetUpCell: UITableViewCell {

    var delegate:YBusinessCellDelegate?
    /// 加
    var addBtn:UIButton!
    /// 减
    var reduceBtn:UIButton!
   
    var indexPath:IndexPath?
    
    var moneyTestField:UITextField!
    
    var reduceMoneyTestField:UITextField!
    
    var dataModel:YBusinessModel? {
        didSet {
           moneyTestField.text = dataModel?.money
           reduceMoneyTestField.text = dataModel?.reduceMoney
            if indexPath?.row == 0 {
                reduceBtn.isHidden = true
            }
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
    
    func setUpUI(){

        //满
        let nameLabel = UILabel.init()
        nameLabel.font = getSystemFont(size: 14.0)
        nameLabel.textAlignment = .left
        nameLabel.text = "满"
        nameLabel.textColor = UIColor.hexadecimalColor(hexString: "b2b2b2", alpha: 1)
        self.contentView.addSubview(nameLabel)
     
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(15)
            make.height.equalTo(20)
        }
        
        
        let moneyTextFiled = UITextField.init()
        moneyTextFiled.text = "99999.00"
        moneyTextFiled.font = UIFont.systemFont(ofSize: 14)
        moneyTextFiled.textColor = UIColor.hexadecimalColor(hexString: "000000", alpha: 1.0)
         moneyTextFiled.textAlignment = .center
        self.contentView.addSubview(moneyTextFiled)
        self.moneyTestField = moneyTextFiled
        moneyTextFiled.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(7)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        let priceNameLabel = UILabel.init()
        priceNameLabel.font = getSystemFont(size: 14.0)
        priceNameLabel.textAlignment = .left
        priceNameLabel.text = "元"
        priceNameLabel.textColor = UIColor.hexadecimalColor(hexString: "b2b2b2", alpha: 1)
        self.contentView.addSubview(priceNameLabel)
       
        priceNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(moneyTextFiled.snp.right).offset(7)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(15)
            make.height.equalTo(20)
        }
        
       //减
        
        let reduceNameLabel = UILabel.init()
        reduceNameLabel.font = getSystemFont(size: 14.0)
        reduceNameLabel.textAlignment = .left
        reduceNameLabel.text = "减"
        reduceNameLabel.textColor = UIColor.hexadecimalColor(hexString: "b2b2b2", alpha: 1)
        self.contentView.addSubview(reduceNameLabel)
        
        reduceNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(priceNameLabel.snp.right).offset(50)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(15)
            make.height.equalTo(20)
        }
        
        
        let reduceMoneyTextFiled = UITextField.init()
        reduceMoneyTextFiled.text = "19.00"
        reduceMoneyTextFiled.font = UIFont.systemFont(ofSize: 14)
        reduceMoneyTextFiled.textColor = UIColor.hexadecimalColor(hexString: "000000", alpha: 1.0)
        reduceMoneyTextFiled.textAlignment = .center
        self.contentView.addSubview(reduceMoneyTextFiled)
        self.reduceMoneyTestField = reduceMoneyTextFiled
        reduceMoneyTextFiled.snp.makeConstraints { (make) in
            make.left.equalTo(reduceNameLabel.snp.right).offset(7)
            make.width.equalTo(70)
            make.height.equalTo(20)
            make.centerY.equalTo(self.contentView)
        }
        
        let reducePriceLabel = UILabel.init()
        reducePriceLabel.font = getSystemFont(size: 14.0)
        reducePriceLabel.textAlignment = .left
        reducePriceLabel.text = "元"
        reducePriceLabel.textColor = UIColor.hexadecimalColor(hexString: "b2b2b2", alpha: 1)
        self.contentView.addSubview(reducePriceLabel)
        
        reducePriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(reduceMoneyTextFiled.snp.right).offset(7)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(15)
            make.height.equalTo(20)
        }
        
        
        //加
        let addBtn = UIButton.init(type: .custom)
        addBtn.setImage(UIImage.init(named: "Setting_Add_icon"), for: .normal)
        self.contentView.addSubview(addBtn)
        addBtn.addTarget(self, action: #selector(addBtnAction(sender:)), for: .touchUpInside)
        self.addBtn = addBtn
        addBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        //减
        let reduceBtn = UIButton.init(type: .custom)
        reduceBtn.setImage(UIImage.init(named: "Setting_Clean_icon"), for: .normal)
        self.contentView.addSubview(reduceBtn)
         reduceBtn.addTarget(self, action: #selector(reduceBtnAction(sender:)), for: .touchUpInside)
        self.reduceBtn = reduceBtn
        reduceBtn.snp.makeConstraints { (make) in
            make.right.equalTo(addBtn.snp.left).offset(-10)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        //分割线
        let lineView = UIView.init()
        lineView.backgroundColor = UIColor.hexadecimalColor(hexString: "ececec", alpha: 1.0)
        
        self.contentView.addSubview(lineView)
        
        lineView.snp.makeConstraints { (make) in
           make.bottom.left.right.equalTo(self.contentView)
            make.height.equalTo(1)
        }
    }
    
    @objc func addBtnAction(sender: UIButton) {
        guard self.delegate != nil else {
            return
        }
        self.delegate?.addBtnAction(index: (indexPath?.row)!)
    }
    
    @objc func reduceBtnAction(sender: UIButton) {
        guard self.delegate != nil else {
            return
        }
        self.delegate?.reduceBtnAction(index: (indexPath?.row)!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
