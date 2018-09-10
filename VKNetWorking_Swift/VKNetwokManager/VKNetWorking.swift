//
//  VKNetWorking.swift
//  VKOOY_iOS
//
//  Created by Mike on 18/9/5.
//  E-mail:vkooys@163.com
//  Copyright © 2018年 VKOOY. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias VKNetDoneClosure = (_ done:JSON)->Void  //  @escaping
typealias VKNetSucClosure = (_ success:JSON)->Void
typealias VKNetFailClosure = (_ error : Error)->Void

class VKNetWorking: NSObject {
    
    class func GET(_ API: String,
                    param: [String : Any],
                    vc: UIViewController,
                    done : VKNetDoneClosure?,
                    success : VKNetSucClosure?,
                    failture : VKNetFailClosure?) {
        
        self.Request(API, param: param, vc: vc, method: HTTPMethod.get, done: done, success: success, failture: failture)
    }
    
    class func POST(_ API: String,
                    param: [String : Any],
                    vc: UIViewController,
                    done : VKNetDoneClosure?,
                    success : VKNetSucClosure?,
                    failture : VKNetFailClosure?) {
        
        self.Request(API, param: param, vc: vc, method: HTTPMethod.post, done: done, success: success, failture: failture)
    }
    
    class func Request(_ API: String,
                    param: [String : Any],
                    vc: UIViewController,
                    method: HTTPMethod,
                    done : VKNetDoneClosure?,
                    success : VKNetSucClosure?,
                    failture : VKNetFailClosure?) {
        
        //  请求前处理
        self.HandleNetworkBeforeVc(API, param: param, vc: vc, done: done, success: success, failture: failture)
        
        
        Alamofire.request(API, method: method, parameters: param).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                
//                print("\n✅✅✅✅✅✅ API ======Return_Format==========:\n\(API)\n\(value)\n✅✅✅✅✅✅")
                if let value = response.result.value as? [String: AnyObject] {
                    let responseObject = JSON(value)
                    
                    self.HandleNetworkSuccess(responseObject, API: API, param: param, vc: vc, done: done, success: success)
                } else {
                    print("❌❌❌❌❌========返回值========\n\(value)\n❌❌❌❌❌❌")
                }
                
            case .failure(let error):
                
                self.HandleNetworkFailure(API, param: param, vc: vc, error: error, failture: failture)
            }
            
        }
        
    }
    
    //  MARK:请求前处理
    class func HandleNetworkBeforeVc(_ API: String,
                                      param: [String : Any],
                                      vc: UIViewController,
                                      done : VKNetDoneClosure?,
                                      success : VKNetSucClosure?,
                                      failture : VKNetFailClosure?) {
        
        
    }
    
    //  MARK:请求成功处理
    class func HandleNetworkSuccess(_ responseObject: JSON,
                                     API: String,
                                     param: [String : Any],
                                     vc: UIViewController,
                                     done : VKNetDoneClosure?,
                                     success : VKNetSucClosure?) {
        
        //  实现了done回调，return
        if done != nil {
            done!(responseObject)
            return
        }
        
        //  这里可以做一些错误码判断 算失败
//        if responseObject["error_code"] != 0 {
//
//            print("请求error_code != 0")
//            print("❌❌❌❌❌========请求error_code != 0========❌❌❌❌❌❌")
//
//            return
//        }
        
        //  实现了done回调
        if success != nil {
            //  取指定层级的值和一些判断可以写在这里
//            let result = responseObject["result"]["data"]
            
            success!(responseObject)

        }
        
    }
    
    //  MARK:请求失败处理
    class func HandleNetworkFailure(_ API: String,
                                    param: [String : Any],
                                    vc: UIViewController,
                                    error: Error,
                                    failture : VKNetFailClosure?) {
        
        if failture != nil {
            failture!(error)
            return
        }
        
        print("❌❌❌❌❌========error========\n\(error)\n❌❌❌❌❌❌")
    }
    
    
    
    
}




