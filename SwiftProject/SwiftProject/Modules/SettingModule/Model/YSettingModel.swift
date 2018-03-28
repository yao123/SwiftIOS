//
//  YSettingModel.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/27.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit
import SwiftyJSON
class YSettingModel: NSObject {

    /// 名称
    var name:String?
    /// 图片名称
    var imageName:String?
    //MARK:-单利
    static let shareSettingModel = YSettingModel()
    private override init() {
        
    }
    
    static func getSettingData(dic:Dictionary<String,Any>) -> YSettingModel {
        let model = YSettingModel()
        let dicData = JSON(dic)
        model.name = dicData["name"].stringValue
        model.imageName = dicData["imageName"].stringValue
        
        return model
    }
}
