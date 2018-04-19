//
//  YTestVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/3/23.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

protocol YTestVCDelegate:NSObjectProtocol{
    
    func testMethodOne()
    func testMethodTwo(str:String)
}

//格式: typealias 闭包名称 = (参数名称: 参数类型) -> 返回值类型
typealias TestBlock = (_ str:String) -> Void



class YTestVC: YBaseVC ,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    /// 代理
    var deelgate:YTestVCDelegate?
    /// block
    var block:TestBlock?
   
    /// block属性
    var nameBlock:(() -> ())?
    
    lazy var mainScro:UIScrollView = {
        
        let mainScroView = UIScrollView.init()
        mainScroView.backgroundColor = UIColor.darkGray
        mainScroView.isPagingEnabled = true
        return mainScroView
    }()
    
    lazy  var collectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        //布局 vertical：竖直方向 horizontal：水平方向
        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 10
//        layout.minimumLineSpacing = 10
        //设置每个item的尺寸 可以在代理设置
//        layout.itemSize = CGSize.init(width: 100, height: 100`)
        let collect = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - 64), collectionViewLayout: layout)
        collect.backgroundColor = UIColor.darkGray
        collect.register(YTestCell.classForCoder(), forCellWithReuseIdentifier: "YTestCell")
        return collect
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        creatDataPickerPiew()
//        creatMainsScro()
//        creatBtn()
        creatCollectionView()
        // Do any additional setup after loading the view.
        
/* 日期字符串修改时间格式
        let dateStr = "2018-03-26 16:23"
        let dateFormate = DateFormatter.init()
        dateFormate.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print(dateStr.exChangeStrDateFormat(formatter: dateFormate))
*/
        
/* 字符串替换
      var testStr = "abc 耀 abc 雪 abc 淇"
        var range = testStr.range(of: "abc")
      /*
        while  range != nil {
            testStr.replaceSubrange(range!, with: "你好")
            range = testStr.range(of: "abc")
        }
       */
        repeat {
            testStr.replaceSubrange(range!, with: "你好")
            range = testStr.range(of: "abc")
        } while  range != nil
          print(testStr)
 */
        
        if test(dataSre: "haha").success {
            print("haha")
        }
        
        let total = {(parm:Int)-> Int in
           return parm*parm
        }
        print(total(3))
        
        var arrays = [1,4,3,5]

      let arr =  mySort(array: arrays) { (index:Int, nextIndex:Int) -> Bool in
            return arrays[index] as! Int > arrays[nextIndex] as! Int
        }
       print(arr)
    }

    func MyFunc(param:Int) -> Int {
        return param * param
    }
    
    func mySort(array:Array<Any>,sortClourse:(Int,Int) -> Bool) -> Array<Any> {
        var dataArray = array
        for index in array.indices {
            //最后一个元素返回
            if index == dataArray.count - 1 {
                break
            }
            
            //冒泡排序
            for i in 0 ... (dataArray.count - 1 - index - 1) {
                //调用传递进来的闭包算法
                if sortClourse(i,i+1){
                  print(i)
                }else{
                    dataArray.swapAt(i, i+1)
                }
            }
        }
        return dataArray
    }
    
    func test(dataSre:String) -> (success:Bool,dadd:String) {
      
        return (true,"haha")
        
    }
    //MARK:-
    //MARK:1.View生命周期
    
    func creatDataPickerPiew(){
        let dataPiker = UIDatePicker.init(frame: self.view.bounds)

        //改变时间格式
        dataPiker.datePickerMode = .dateAndTime
        dataPiker.locale = Locale(identifier: "zh_CN")
        dataPiker.minuteInterval =  10
        let now = Date()
        //追加时间 60*60意思可以滑动比现在的时间早一小时
//        let newDate = now.addingTimeInterval(TimeInterval(-60*60))
        dataPiker.minimumDate = now
    
        dataPiker.addTarget(self, action: #selector(dataChanged(sender:)), for: .valueChanged)
        self.view.addSubview(dataPiker)
    }
    
    @objc func dataChanged(sender:UIDatePicker){
       
        let formatter = DateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        print(formatter.string(from: sender.date))
        
        
       /* 时间字符串 转到时间格式
         let formatterDate = DateFormatter()
         formatterDate.dateFormat = "yyyy-MM-dd HH:mm"
        
         let dataStr = "2018-03-23 19:00"
        
        let ssDate:Date = formatterDate.date(from: dataStr)!
        
          formatterDate.dateFormat = "yyyy-MM-dd"

        print( "Date类型 = " , formatterDate.string(from: ssDate))
 */
    }
    func creatCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
    }
    
    
    func creatMainsScro(){
        mainScro.delegate = self
        mainScro.contentSize = CGSize.init(width: KScreenWidth * CGFloat(5), height: 200)
        self.view.addSubview(mainScro)
        mainScro.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(200)
        }
        
        for i in 0 ..< 5 {
            
            let view = UIView.init()
    
//            view.frame = CGRect.init(x: CGFloat(i) * KScreenWidth , y: 0, width: KScreenWidth, height: 200)
            if i == 0 {
                view.backgroundColor = UIColor.blue
            }else if i == 1 {
                view.backgroundColor = UIColor.orange
            }else if i == 2 {
                view.backgroundColor = UIColor.darkGray
            }else if i == 3 {
                view.backgroundColor = UIColor.red
            }else{
                view.backgroundColor = UIColor.gray
            }
            
            mainScro.addSubview(view)
            
            view.snp.makeConstraints({ (make) in
                make.height.equalTo(200)
                make.top.equalTo(mainScro)
                make.width.equalTo(KScreenWidth)
                make.left.equalTo(CGFloat(i) * KScreenWidth)
            })
        }
    }
    
    func creatBtn(){
       let btn = UIButton.init(type: .custom)
       btn.setTitle("测试", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
       btn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
       self.view.addSubview(btn)
        
        btn.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(80)
            make.height.equalTo(25)
        }
    }
    
    @objc func btnAction(sender:UIButton){
        
        guard self.block != nil else {
            return
        }
         self.block!("nihao")
        
        if self.deelgate != nil {
            self.deelgate?.testMethodOne()
            self.deelgate?.testMethodTwo(str: "代理")
        }
        
        self.nameBlock!()
       
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TestNoification"), object: nil)
    }
    
    //MARK:-
    //MARK:2.代理
    //MARK: 系统代理
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 27
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YTestCell", for: indexPath) as! YTestCell
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: KScreenWidth / 3, height: KScreenWidth / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //列间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("滑动执行")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print("减速执行")
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
