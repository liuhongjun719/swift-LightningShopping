//
//  ModelItem.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/17.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON

class ModelItem: Mappable {
    var bigPicUrl: String?
    var brand: String?
    var property: String?
    var price: Int?
    var name: String?

    
    required init?(map: Map) {
//        if map.JSONDictionary["name"] == nil {
//            return nil
//        }
    }
    public func mapping(map: Map) {
        bigPicUrl    <- map["bigPicUrl"]
        brand         <- map["brand"]
        property      <- map["property"]
        price       <- map["price"]
        name       <- map["name"]
    }



    
    

}
