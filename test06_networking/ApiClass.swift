//
//  ApiClass.swift
//  test06_networking
//
//  Created by Apple on 2017/1/12.
//  Copyright © 2017年 DragonDrum. All rights reserved.
//


import Alamofire
import SwiftyJSON

class ApiClass {

  static  func perform(email: String , password :String , completionHandler: @escaping (_ isSuccess:Bool) -> ())
    {
        var request = NetworkRequest()
        request.endpoint = "client/session/email/login"
        request.apiName = "UserLoginByEmail"
        request.methodStr = HTTPMethod.post.rawValue
        
        request.params = [
            "email":email as AnyObject,
            "password":password as AnyObject,
            "os_type":"iOS" as AnyObject,
            "device_type":"" as AnyObject
            ]
        
        
        NetworkClient.performRequest(request, successHandler: {
            (json) in
            
            let jsonData = json["data"]
            let jsonProfile = jsonData["user_profile"]
            
            
            
            
        }, errorHandler: {
            (Error) in
            
        })
    }

}



