//
//  YBusinessModel.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/27.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit
import SwiftyJSON
class YBusinessModel: NSObject {

    ///是否营业状态
    var isNormal:Bool?
    /// 是否暂停营业
    var isSuspended:Bool?
    ///是否满减优惠
    var isAcitivity:Bool?
    
    /// 预约暂停营业开始时间
    var suspendStart:String?
    ///预约暂停营业结束时间
    var suspendEnd:String?
    ///原价
    var money:String?
    ///促销价
    var reduceMoney:String?
    
    var acitivityArray:Array<YBusinessModel>? = Array()
    
    /*
    static let shareModel = YBusinessModel.init()
    
    private override init() {
        
    }
    */
    static func getBusinessData(dicData:Dictionary<String,Any>) -> YBusinessModel {
        let model = YBusinessModel()
        let dic = JSON(dicData)
        
         model.isNormal = dic["isNormal"].boolValue
         model.isSuspended = dic["isSuspended"].boolValue
         model.isAcitivity = dic["isAcitivity"].boolValue
         model.suspendStart = dic["suspendStart"].stringValue
         model.suspendEnd = dic["suspendEnd"].stringValue
        model.getActivityModelArray(dataArray: dicData["activities"] as! Array)
        
        return model
    }
    
    func getActivityModelArray(dataArray:Array<Any>) {
       
        for dic in dataArray {
            let model = YBusinessModel()
            let dicData = JSON(dic)
             model.money = dicData["money"].stringValue
             model.reduceMoney = dicData["reduceMoney"].stringValue
            acitivityArray?.append(model)
        }
        
    }
    
}
