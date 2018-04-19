//
//  YBaseModel.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/30.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YBaseModel: NSObject {

    enum Mnthod : Int {
        case add = 5
        case reduce
        case Mul
    }
    
    struct  Car {
        var price:Int?
        var name:String?
        mutating func getCarInformation(carName:String,carPrice:Int) {
            price = carPrice
            name = carName
        }
    }
    
    var nameStr:String?
    //Mark:-单利1
    static var shareModel:YBaseModel = {
       let model = YBaseModel()
        return model
    }()
    
    func getName(name:String) {
        nameStr = name
    }
    
    //Mark:-单利2
    static let shareBaseModel = YBaseModel()
    
    //可加可不加
    class func shareInstance() -> YBaseModel {
        
        return shareBaseModel
    }

    /// 存储 key value
    ///
    /// - Parameters:
    ///   - key: 存储的key值
    ///   - value: 存储的value值
    func storageUserDefaults(key:String,value:Any) {
        let nb = UserDefaults.standard
        nb.set(value, forKey: key)
        nb.synchronize()
    }
    func sss(m:Mnthod) {
        if m.rawValue == 6 {
            print("uuuuuu")
        }
    }
    /// 本地存储根据key取值
    ///
    /// - Parameter key: key值
    /// - Returns: 返回存储的value
    func takeOutStorageUserDefaults(key:String) -> Any {
         let nb = UserDefaults.standard
        
        return nb.object(forKey:key) as Any
    }
    
    /// 删除存储
    ///
    /// - Parameter key: 存储的key
    func delegateStorageUserDefaults(key:String) {
        let nb = UserDefaults.standard
        nb.removeObject(forKey: key)
        nb.synchronize()
    }
    
    /// 判断本地有没有存储数据
    ///
    /// - Parameter key: 存储的key值
    /// - Returns: 无数据返回false
    func isJudgeEmptyStorageUserDegaults(key:String) -> Bool {
        let nb = UserDefaults.standard
        
        if nb.object(forKey: key) != nil {
            return false
        }else{
            return true
        }
    }
}
