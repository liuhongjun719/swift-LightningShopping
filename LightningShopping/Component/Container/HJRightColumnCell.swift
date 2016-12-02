//
//  HJRightColumnCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/11.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON


class HJRightColumnCell: UICollectionViewCell {
    var backView: UIView!
//    var titleLabel: UILabel!
//    var image: UIImageView!
//    var price: UILabel!
//    var promotionPrice: UILabel!
//    var add: UIButton!
//    var numberView: UIView!
//    var reduce: UIButton!
    
    
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
//            titleLabel.text = String.init(format: "%@",newValue["name"].stringValue as CVarArg)
//            price.text = "\( newValue["property"].stringValue)"
//            promotionPrice.text = "¥"+"\(newValue["promotionPrice"])"
//            
//            let imageUrl = "http://imgsize.52shangou.com/img/" + "\(newValue["smallPicUrl"])"
//            image.af_setImage(withURL: URL(string: imageUrl)!)
//            changeNumberView.number.text = String.init(format: "%@",newValue["buylimit"].stringValue as CVarArg)
            
            let imageUrl = "http://imgsize.52shangou.com/img/" + "\(newValue["bigPicUrl"].stringValue)"
            
            leftImage.af_setImage(withURL: URL(string: imageUrl)!)
            itemName.text = newValue["itemName"].stringValue
            property.text = newValue["property"].stringValue + " / \(newValue["unit"].stringValue)"
            promotionPrice.text = "￥ \(newValue["promotionPrice"].stringValue)"
            offlinePrice.text = "￥ \(newValue["offlinePrice"].stringValue)"
        }
    }
    
    
    var changeNumberView: ChangeGoodsNumberView!
    typealias ChangeGooodsNumberBlock = () -> Swift.Void
    var changeGooodsNumberBlock: ChangeGooodsNumberBlock?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.red
        
        backView = UIView()
        backView.backgroundColor = UIColor.white
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 4
        backView.layer.borderColor = UIColor.init(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1.0).cgColor
        backView.layer.borderWidth = 0.5
        self.addSubview(backView)
        
        leftImage = UIImageView()
        backView.addSubview(leftImage)
        
        itemName = UILabel()
        itemName.numberOfLines = 2
        backView.addSubview(itemName)
        
        property = UILabel()
        property.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        property.font = UIFont.systemFont(ofSize: 12)
        backView.addSubview(property)
        
        
        promotionPrice = UILabel()
        promotionPrice.font = UIFont.systemFont(ofSize: 13)
        promotionPrice.textColor = UIColor.red
        backView.addSubview(promotionPrice)
        
        offlinePrice = UILabel()
        offlinePrice.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        offlinePrice.font = UIFont.systemFont(ofSize: 13)
        backView.addSubview(offlinePrice)
        
  
        
        
        
        
        
        backView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(5)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-5)
            make.centerY.equalTo(self.snp.centerY)
            make.bottom.equalTo(self).offset(-5)
        }
        
        leftImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(backView).offset(5)
            make.left.equalTo(backView).offset(5)
            make.right.equalTo(backView).offset(-5)
            make.height.equalTo(backView).multipliedBy(0.6)
        }

        itemName.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(leftImage.snp.bottom)
            make.left.equalTo(leftImage)
            make.right.equalTo(leftImage)
            make.height.equalTo(backView).multipliedBy(0.1)
        }

        
        property.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(itemName.snp.bottom)
            make.left.equalTo(itemName)
            make.right.equalTo(itemName)
            make.height.lessThanOrEqualTo(backView).multipliedBy(0.1)
        }
        
        
        promotionPrice.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(property.snp.bottom).offset(10)
            make.left.equalTo(itemName)
            make.width.lessThanOrEqualTo(60)
            make.height.equalTo(property)
        }
        
        offlinePrice.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(promotionPrice)
            make.left.equalTo(promotionPrice.snp.right).offset(5)
            make.width.greaterThanOrEqualTo(60)
            make.height.equalTo(promotionPrice)
        }

 
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
