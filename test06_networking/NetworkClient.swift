//
//  NetworkClient.swift
//  test06_networking
//
//  Created by Apple on 2017/1/12.
//  Copyright © 2017年 DragonDrum. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct NetworkClient{
    // MARK: - Login & ForgetPassword & Register
   static func performRequest(_ networkRequest: NetworkRequest,successHandler: @escaping (_ json:JSON) -> () , errorHandler: @escaping (_ error:Error?) -> ()){
        let URL = Foundation.URL(string: networkRequest.baseUrl + networkRequest.endpoint)!
        var mutableURLRequest = URLRequest(url: URL as URL)
        mutableURLRequest.httpMethod = networkRequest.methodStr
        
        do {
            mutableURLRequest.httpBody = try JSONSerialization.data(withJSONObject: networkRequest.params, options: JSONSerialization.WritingOptions())
        } catch {
            // No-op
        }
        
        for item in networkRequest.urlRequest{
            mutableURLRequest.setValue(item.key, forHTTPHeaderField: item.value)
        }
        
        Alamofire.request(mutableURLRequest as URLRequestConvertible).responseString { response in
            print("Success: \(response.result.isSuccess)")
            print("Response String: \(response.result.value)")
            print("ApiName: \(networkRequest.apiName)")
            if (response.result.isSuccess){
                if response.result.value != nil {
                    let json : JSON = JSON(data: response.data!);
                    let jsonerr = json["error"]
                    if (NetworkClient.ErrorCode(errorCode: jsonerr["code"].stringValue)){
                        successHandler(json)
                    }else{
                         errorHandler(response.result.error)
                    }
                }else{
                   errorHandler(response.result.error)
                }
            }else{
               errorHandler(response.result.error)
            }
        }
    }
    
    static func ErrorCode(errorCode:String) -> Bool {
       return true
    }
}
