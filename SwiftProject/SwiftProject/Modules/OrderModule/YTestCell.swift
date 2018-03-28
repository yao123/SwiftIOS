//
//  YTestCell.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/23.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YTestCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        creatViewUI()
    }
    
    func creatViewUI(){
        let view = UIView.init()
        view.backgroundColor = UIColor.orange
        self.contentView.addSubview(view)
        
        view.snp.makeConstraints { (make) in
       
            make.center.equalTo(self.contentView)
       
            make.width.equalTo(100)
        
            make.height.equalTo(100)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
