//
//  VKHttpDemoVC.swift
//  VKOOY_iOS
//
//  Created by Mike on 18/9/5.
//  E-mail:vkooys@163.com
//  Copyright © 2018年 VKOOY. All rights reserved.
//

import UIKit
import Foundation

import ObjectMapper

class VKHttpDemoVC: UIViewController {
    
    var dataArr = [mod_douban]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VKNetWorking"
        
        self.view.backgroundColor = UIColor.white;
        
        let button = UIButton.init(frame: CGRect(x:100,y:200,width:100,height:40))
        button.backgroundColor = UIColor.gray
        button.setTitle("点我", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)

        
    }
    
    @objc func buttonAction() {
        print("请求中...")
        
        self.request()
    }
    
    func request() {
        let urlString = "https://api.douban.com/v2/movie/in_theaters"
        let params = ["start":"0","count":"10"]
        
        VKNetWorking.GET(urlString, param: params, vc: self, done: nil, success: { (json) in
            
            print("---------------------请求返回的所有数据--------------------------")
            print(json)
            
            //  字典转模型
            let model = Mapper<mod_douban>().map(JSONObject:json.dictionaryObject!)
            //  去下级层
//            let arr:Array<SubjectsItem> = (model?.subjects)!
            
            //  打印名字测试
            let title: String = model?.title ?? "没获取到呢"
            
            print("---------------------title--------------------------")
            print(title)
            
            self.alertTip(title: title)
            
        }, failture: nil)
        
    }
    
    
    func alertTip(title: String) {
        let alertController = UIAlertController(title: title,
                                                message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
            print("点击了确定")
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
