//
//  YProductModel.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/15.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit
import SwiftyJSON
class YProductModel: NSObject {

    var prouctName:String?
    var imageName:String?
   /*
    //Mark:-单利
    static let shareProductModel = YProductModel()
    
    private override init() {
        
    }
  */
   static func getProductModelData(dic:Dictionary<String,String>) -> YProductModel {
        let model = YProductModel.init()     
        let dicData = JSON(dic)
        model.prouctName = dicData["prouctName"].stringValue
        model.imageName = dicData["imageName"].stringValue
        
        return model
    }
}
