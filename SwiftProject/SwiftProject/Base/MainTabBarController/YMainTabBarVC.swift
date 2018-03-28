//
//  YMainTabBarVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/13.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YMainTabBarVC: UITabBarController,UITabBarControllerDelegate {

    /// tabbar背景图片
    var backView:UIView!
    
    //MARK:-
    //MARK:1.View生命周期
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //添加子控制器
        addChildBaseController()
        addTabBarShadow()
        // Do any additional setup after loading the view.
        self.backView = UIView.init()
        backView.frame = CGRect.init(x: 0, y: 0, width: KScreenWidth / 4, height: 49)
        backView.backgroundColor = UIColor.hexadecimalColor(hexString: "4a90e2", alpha: 1)
        self.tabBar.addSubview(backView)
        //backView显示在下面
        self.tabBar.sendSubview(toBack: backView)
        self.delegate = self
    }

    //MARK:-添加子控制器
    func addChildBaseController() {
        //订单
        let orderVC = YOrderVC()
        setChildVC(vc: orderVC, title: "订单", normalImageTitle: "Order_UnSelect_icon", selectImageTitle: "Order_Select_icon")
        
        //产品
        let productVC = YProductVC()
        setChildVC(vc: productVC, title: "产品", normalImageTitle: "Product_UnSelect_icon", selectImageTitle: "Product_Select_icon")
        
        //消息
        let messageVC = YMessageVC()
        setChildVC(vc: messageVC, title: "消息", normalImageTitle: "Message_UnSelect_icon", selectImageTitle: "Message_Select_icon")
        
        //设置
        let settingVC = YSettingVC()
        setChildVC(vc: settingVC, title: "设置", normalImageTitle: "Setting_UnSelect_icon", selectImageTitle: "Setting_Select_icon")
    }
    
    func setChildVC(vc:UIViewController,title:String,normalImageTitle:String,selectImageTitle:String) {
        vc.title = title
        let noremalImage = UIImage.init(named: normalImageTitle)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.image = noremalImage
        
        let selectImage = UIImage.init(named: selectImageTitle)?.withRenderingMode(.alwaysOriginal)

        vc.tabBarItem.selectedImage = selectImage
        let baseNav = YBaseNavigationVC.init(rootViewController: vc)
        //修改颜色
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.hexadecimalColor(hexString: "4a90e2", alpha: 1)],for:.normal)
       
        //修改字体颜色
//        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14.0)], for: .normal)
        
    vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.white],for:.selected)
        
        self.addChildViewController(baseNav)
    }
    
      //MARK:-添加阴影
    func addTabBarShadow() {
       
        self.tabBar.backgroundColor = UIColor.white
        //移除顶部线条
        self.tabBar.backgroundImage = UIImage.init()
        self.tabBar.shadowImage = UIImage.init()
        
        //设置阴影
        dropShadowWithOffSet(offset: CGSize.init(width: 0, height: 1), radius: 3, color: UIColor.black, opacity: 0.3)
    }
    
    func dropShadowWithOffSet(offset:CGSize,radius:CGFloat,color:UIColor,opacity:CGFloat) {
       
       
        /*
         CGMutablePathRef path = CGPathCreateMutable();
         CGPathAddRect(path, NULL, self.tabBar.bounds);
         self.tabBar.layer.shadowPath = path;
         CGPathCloseSubpath(path);
         CGPathRelease(path);
        */
        //替代 oc
        let path  = CGMutablePath()
        path.addRect(self.tabBar.bounds)
        self.tabBar.layer.shadowPath = path
        path.closeSubpath()
        
        //阴影颜色
        self.tabBar.layer.shadowColor = color.cgColor
         //阴影偏移量
        self.tabBar.layer.shadowOffset = offset
        //阴影圆角
        self.tabBar.layer.shadowRadius = radius
         //阴影的透明度，默认是0   范围 0-1 越大越不透明
        self.tabBar.layer.shadowOpacity = Float(opacity)
        self.tabBar.clipsToBounds = false
    }
    
    //MARK:-
    //MARK:2.代理
    //MARK: 系统代理 继承
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex;
        backView.frame = CGRect.init(x: KScreenWidth / 4  * CGFloat(index), y: 0, width: KScreenWidth / 4, height: 49)
    }
  
    //MARK: 自定义代理
    
    //MARK:-
    //MARK:3.用户交互
   
    //MARK:-
    //MARK:4.数据处理
    
    //MARK:-
    //MARK:5.其它
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
