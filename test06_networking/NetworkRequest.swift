//
//  NetworkRequest.swift
//  test06_networking
//
//  Created by Apple on 2017/1/12.
//  Copyright © 2017年 DragonDrum. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct  NetworkRequest {
    var endpoint: String = ""
    var apiName: String  = ""
    var baseUrl: String = ""
    var methodStr: String = ""
    var params: [String : AnyObject]  = [:]
    var urlRequest: [String : String] = ["application/json":"Content-Type"]
    
}
