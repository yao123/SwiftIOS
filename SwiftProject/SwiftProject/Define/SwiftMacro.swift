//
//  SwiftMacro.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/13.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit
import SnapKit

/// 屏幕高度
let KScreenHeight = UIScreen.main.bounds.size.height

/// 屏幕宽度
let KScreenWidth = UIScreen.main.bounds.size.width

/// 判断是否是iphoneX
let IS_IphoneX = UIApplication.shared.statusBarFrame.size.height > 20 ? true : false

/// 状态栏高度
let KStatusBarHeight = UIApplication.shared.statusBarFrame.size.height

/// 导航的高度
let KNavBarHeight =  IS_IphoneX ? 88 : 64

/// AppDelegate 代理
let AppDelegateInstall = UIApplication.shared.delegate as! AppDelegate

let BgViewColor = UIColor.hexadecimalColor(hexString: "f2f2f2", alpha: 1)

/// 获取字体大小
///
/// - Parameter size: 字体的大小
/// - Returns: 返回字体的大小
func getSystemFont(size:Float) -> UIFont{
    
    return UIFont.systemFont(ofSize: CGFloat(size))
}
