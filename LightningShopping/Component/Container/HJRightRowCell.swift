//
//  HJRightRowCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/11.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON

class HJRightRowCell: UICollectionViewCell {
    var leftImage: UIImageView!//商品图片
    var itemName: UILabel!//商品名称
    var property: UILabel!//单位
    
    var promotionPrice: UILabel!//促销价promotionPrice为0时用offlinePrice的值，而offlinePrice不需要再显示
    var offlinePrice: UILabel!//原价
    
    var separatorLine: UIView!//分割线
    
    var data: JSON {
        get {
            return self.data
        }
        
        set {
            let imageUrl = "http://imgsize.52shangou.com/img/" + "\(newValue["bigPicUrl"].stringValue)"

            leftImage.af_setImage(withURL: URL(string: imageUrl)!)
            itemName.text = newValue["itemName"].stringValue
            property.text = newValue["property"].stringValue + " / \(newValue["unit"].stringValue)"
            promotionPrice.text = "￥ \(newValue["promotionPrice"].stringValue)"
            offlinePrice.text = "￥ \(newValue["offlinePrice"].stringValue)"

        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("frame---------:\(frame)")
        self.backgroundColor = UIColor.white
        leftImage = UIImageView()
        self.addSubview(leftImage)
        
        itemName = UILabel()
        self.addSubview(itemName)
        
        property = UILabel()
        property.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        property.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(property)
        
        
        promotionPrice = UILabel()
        promotionPrice.font = UIFont.systemFont(ofSize: 13)
        promotionPrice.textColor = UIColor.red
        self.addSubview(promotionPrice)
        
        offlinePrice = UILabel()
        offlinePrice.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        offlinePrice.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(offlinePrice)
        
        separatorLine = UIView()
        separatorLine.backgroundColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        self.addSubview(separatorLine)
        
        
  
        
        leftImage.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self)
            make.width.height.equalTo(60)
        }
        
        
        itemName.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(leftImage)
            make.left.equalTo(leftImage.snp.right).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.lessThanOrEqualTo(30)
        }
     
        property.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(itemName.snp.bottom)
            make.left.equalTo(itemName)
            make.right.equalTo(itemName)
            make.height.lessThanOrEqualTo(15)
        }
        
        separatorLine.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self)
            make.height.equalTo(1)
            make.right.equalTo(self)
            make.left.equalTo(self)
        }
        
        
        promotionPrice.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(separatorLine.snp.top).offset(-10)
            make.left.equalTo(itemName)
            make.width.lessThanOrEqualTo(60)
            make.height.lessThanOrEqualTo(15)
        }
        
        offlinePrice.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(promotionPrice)
            make.left.equalTo(promotionPrice.snp.right).offset(5)
            make.width.greaterThanOrEqualTo(60)
            make.height.lessThanOrEqualTo(promotionPrice)
        }
        
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
