//
//  StringMacro.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/14.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

extension String {
    
    /// 判断字符串是否为空
    ///
    /// - Returns: 空的话返回true
    func judgeStrIsEmpty() -> Bool {
        
        let str = self
        
        if str.isEmpty {
            return true
        }else{
            return false
        }
    }
    
    /// 判断是否是手机号
    ///
    /// - Returns: 手机号返回true
    func isTelNumber()-> Bool
        
    {
        
        let mobile = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
        
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        if ((regextestmobile.evaluate(with: self) == true)
            
            || (regextestcm.evaluate(with: self)  == true)
            
            || (regextestct.evaluate(with: self) == true)
            
            || (regextestcu.evaluate(with: self) == true))
            
        {
            
            return true
            
        }
            
        else
            
        {
            
            return false
            
        }
        
    }
    
    
    /// 截取字符串
    ///
    /// - Parameters:
    ///   - startIndex: 字符串的初始位置向后第几位
    ///   - endIndex: 从字符串的末位置向前第几位
    /// - Returns: 返回截取后的字符串
    func interceptionString(startStrIndex:Int,endStrIndex:Int) -> String {
        let temStr = self
        if !temStr.isEmpty {
          
          return String(temStr[temStr.index(temStr.startIndex, offsetBy: startStrIndex) ..< temStr.index(temStr.endIndex, offsetBy: -endStrIndex)])
        }else{
            return ""
        }
       
    }
    
    func exChangeStrDateFormat(formatter:DateFormatter) -> String {
        
        let dateFormaterr = DateFormatter.init()
        //时间格式必须和字符串格式一样 否则会出现闪退
        dateFormaterr.dateFormat = "yyyy-MM-dd HH:mm"
        
        let date = dateFormaterr.date(from: self)
        
        //formatter是外面传的时间格式参数
        return formatter.string(from: date!)
    }
    
}
