//
//  YMessageRemaindVC.swift
//  SwiftProject
//
//  Created by xuguangyao on 2018/4/2.
//  Copyright © 2018年 com.haqi. All rights reserved.
//

import UIKit

class YMessageRemaindVC: YBaseVC,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        addBtn()
        // Do any additional setup after loading the view.
    }

    func addBtn() {
        let addBtn = UIButton.init(type: .custom)
        addBtn.setImage(UIImage.init(named: "Setting_Add_icon"), for: .normal)
        self.view.addSubview(addBtn)
        addBtn.addTarget(self, action: #selector(addBtnAction), for: .touchUpInside)
      
        addBtn.snp.makeConstraints { (make) in
        
            make.center.equalTo(self.view)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
   @objc func addBtnAction() {
    
    let alert = UIAlertController.init(title: "请选择", message: "", preferredStyle: .actionSheet)
    let candelAction = UIAlertAction.init(title: "相册", style: .cancel) { (actoin) in
        print("取消")
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker:UIImagePickerController = UIImagePickerController.init()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
//            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    let playAction = UIAlertAction.init(title: "相机", style: .default) { (action) in
        print("play")
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imgPicker : UIImagePickerController = UIImagePickerController()
            imgPicker.sourceType = .camera
            imgPicker.videoQuality = UIImagePickerControllerQualityType.typeLow
            imgPicker.delegate = self
           
             self.present(imgPicker, animated: true, completion: nil)
        }
            
    }
    alert.addAction(candelAction)
    alert.addAction(playAction)
    self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
    }
    
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
