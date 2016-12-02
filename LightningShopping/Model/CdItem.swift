//
//  CdItem.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/19.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import ObjectMapper

class CdItem: Mappable {
    var actDesc: String?


    
    required init?(map: Map) {
        
    }
    public func mapping(map: Map) {
        actDesc    <- map["actDesc"]
        

    }
}
