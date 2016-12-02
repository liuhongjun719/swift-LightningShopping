//
//  FourActListDetailItemCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/29.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import AlamofireImage
import SwiftyJSON

class FourActListDetailItemCell: UICollectionViewCell {
    var backView: UIView!
    var titleLabel: UILabel!
    var image: UIImageView!
    var price: UILabel!
    var promotionPrice: UILabel!
    var add: UIButton!
    var numberView: UIView!
    var reduce: UIButton!
    
//    var savedData: JSON!
    
    var data: JSON {
        get {
            return self.data
        }
        
        set {
            titleLabel.text = String.init(format: "%@",newValue["name"].stringValue as CVarArg)
            price.text = "\( newValue["property"].stringValue)"
            promotionPrice.text = "¥"+"\(newValue["promotionPrice"])"
            
            let imageUrl = "http://imgsize.52shangou.com/img/" + "\(newValue["smallPicUrl"])"
            image.af_setImage(withURL: URL(string: imageUrl)!)
            changeNumberView.number.text = String.init(format: "%@",newValue["buylimit"].stringValue as CVarArg)
        }
    }

    
    var changeNumberView: ChangeGoodsNumberView!
    typealias ChangeGooodsNumberBlock = () -> Swift.Void
    var changeGooodsNumberBlock: ChangeGooodsNumberBlock?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backView = UIView()
        backView.backgroundColor = UIColor.white
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 4
        self.addSubview(backView)
        
        image = UIImageView()
        backView.addSubview(image)
        
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
        
        
        add = UIButton()
        add.backgroundColor = UIColor.init(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        backView.addSubview(add)
        
        
        changeNumberView = ChangeGoodsNumberView(frame: CGRect.init(x: 0, y: 0, width: 80, height: 20))
        changeNumberView.changeGooodsNumberBlock = {(tag) in
            
            //增加或者减少商品数量
//            self.changeNumberView.number.text = String.init(format: "%@",self.savedData["buylimit"].stringValue as CVarArg)
//            var number = self.savedData["buylimit"].int!
//            if tag == 200 {//reduce
//                number -= 1
//            }else if tag == 201 {//add
//                number += 1
//            }
//            self.savedData["buylimit"] = JSON(number)
//            print("number-----------:\(number)")
//            print("buylimit-----------:\(self.savedData["buylimit"])")
            self.changeGooodsNumberBlock!()
        }
        self.addSubview(changeNumberView)
        

        
        
        
        
        
        
        backView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.centerY.equalTo(self.snp.centerY)
            make.bottom.equalTo(self).offset(-10)
        }
        
        image.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(backView).offset(10)
            make.left.equalTo(backView).offset(5)
            make.right.equalTo(backView).offset(-5)
            make.height.equalTo(self).multipliedBy(0.6)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(image.snp.bottom)
            make.left.equalTo(image)
            make.right.equalTo(backView).offset(-5)
            make.height.equalTo(backView).multipliedBy(0.1)
        }
        price.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(image)
            make.height.equalTo(backView).multipliedBy(0.1)
            make.top.equalTo(titleLabel.snp.bottom)
        }
        promotionPrice.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(image)
            make.top.equalTo(price.snp.bottom)
            make.bottom.equalTo(backView).offset(-5)
        }
        
        //number
//        add.snp.makeConstraints { (make) -> Void in
//            make.bottom.equalTo(backView).offset(-10)
//            make.right.equalTo(backView).offset(-10)
////            make.height.equalTo(backView).multipliedBy(0.1)
////            make.width.equalTo(backView).multipliedBy(0.1)
//            make.height.equalTo(20)
//            make.width.equalTo(20)
//        }
        

        changeNumberView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(backView).offset(-10)
            make.right.equalTo(backView).offset(-5)
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        
        
        

        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
