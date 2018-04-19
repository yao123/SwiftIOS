//
//  YBaseView.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/30.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YBaseView: UIView {

    
    
    static let shareBaseView = YBaseView()
    
    func alerView() {
        self.frame = CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight)
        self.backgroundColor = UIColor.red
        UIApplication.shared.keyWindow?.addSubview(self)
    }

}
