//
//  GoodsDetailImageCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/9.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON

class GoodsDetailImageCell: UICollectionViewCell {
    var goodsImage: UIImageView!
    var goodsName: UILabel!
    var goodsVolume: UILabel!
    var goodsPrice: UILabel!
    var sepratorView: UIView!
    

    
    var data: JSON {
        get {
            return self.data
        }
        
        set {
            let imageUrl = "http://imgsize.52shangou.com/img/" + "\(newValue["bigPicUrl"])"
            goodsImage.af_setImage(withURL: URL(string: imageUrl)!)
            goodsName.text = String.init(format: "%@ %@", newValue["brand"].stringValue, newValue["itemName"].stringValue)
            goodsVolume.text = String.init(format: "%@", newValue["property"].stringValue) + " / \(newValue["unit"].stringValue)"
            goodsPrice.text = String.init(format: "￥%@", newValue["price"].stringValue)//调整小数
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        goodsImage = UIImageView()
        self.addSubview(goodsImage)
        
        goodsName = UILabel()
        goodsName.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(goodsName)
        
        goodsVolume = UILabel()
        goodsVolume.textColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 1.0)
        goodsVolume.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(goodsVolume)
        
        goodsPrice = UILabel()
        goodsPrice.font = UIFont.systemFont(ofSize: 20)
        goodsPrice.textColor = UIColor.red
        self.addSubview(goodsPrice)
        
        sepratorView = UIView()
        sepratorView.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        self.addSubview(sepratorView)

        
        
        sepratorView.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(10)
        }
        
        goodsPrice.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(sepratorView.snp.top).offset(-5)
            make.height.equalTo(20)
        }
        
        goodsVolume.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(goodsPrice)
            make.bottom.equalTo(goodsPrice.snp.top)
            make.height.equalTo(20)
        }
        
        
        goodsName.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(goodsVolume)
            make.bottom.equalTo(goodsVolume.snp.top)
            make.height.equalTo(30)
        }
        
        goodsImage.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(goodsName)
            make.bottom.equalTo(goodsName.snp.top)
            make.top.equalTo(self)
        }
        

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
