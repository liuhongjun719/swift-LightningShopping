//
//  FourActListDetailCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/29.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class FourActListDetailCell: UICollectionViewCell {
    var backView: UIView!
    var titleLabel: UILabel!
    var leftImage: UIImageView!
    var price: UILabel!
    var promotionPrice: UILabel!
    
    var data: JSON {
        get {
            return self.data
        }
        
        set {
            titleLabel.text = String.init(format: "%@,%@",newValue["name"].stringValue as CVarArg, newValue["property"].stringValue as CVarArg)
            price.text = "原价 ¥"+"\(newValue["price"])"
            promotionPrice.text = "¥"+"\(newValue["promotionPrice"])"
            
            let imageUrl = "http://imgsize.52shangou.com/img/" + "\(newValue["smallPicUrl"])"
            leftImage.af_setImage(withURL: URL(string: imageUrl)!)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
        backView = UIView()
        backView.backgroundColor = UIColor.white
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 4
        self.addSubview(backView)
        
        leftImage = UIImageView()
        backView.addSubview(leftImage)
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        backView.addSubview(titleLabel)
        
        price = UILabel()
        price.font = UIFont.systemFont(ofSize: 10)
        price.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        backView.addSubview(price)
        
        promotionPrice = UILabel()
        promotionPrice.font = UIFont.systemFont(ofSize: 12)
        backView.addSubview(promotionPrice)
        
        

        
       
        
        backView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(5)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-5)
        }
        
        leftImage.snp.makeConstraints { (make) -> Void in
//            make.top.equalTo(backView).offset(10)
            make.left.equalTo(backView).offset(10)
            make.height.width.equalTo(80)
            make.centerY.equalTo(backView)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(backView).offset(10)
            make.left.equalTo(leftImage.snp.right).offset(5)
            make.right.equalTo(backView).offset(-5)
            make.height.equalTo(backView).multipliedBy(0.4)
        }
        promotionPrice.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(leftImage.snp.right).offset(5)
            make.right.equalTo(backView).offset(-5)
            make.height.equalTo(backView).multipliedBy(0.2)
            make.bottom.equalTo(backView).offset(-5)
        }
        
        price.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(leftImage.snp.right).offset(5)
            make.right.equalTo(backView).offset(-5)
            make.height.equalTo(backView).multipliedBy(0.15)
            make.bottom.equalTo(promotionPrice.snp.top).offset(-5)
        }
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    public func loadData(data: JSON) {        
//        titleLabel.text = String.init(format: "%@,%@",data["name"].stringValue as CVarArg, data["property"].stringValue as CVarArg)
//        price.text = "原价 ¥"+"\(data["price"])"
//        promotionPrice.text = "¥"+"\(data["promotionPrice"])"
//        
//        let imageUrl = "http://imgsize.52shangou.com/img/" + "\(data["smallPicUrl"])"
//        leftImage.af_setImage(withURL: URL(string: imageUrl)!)
//
//    }
}
