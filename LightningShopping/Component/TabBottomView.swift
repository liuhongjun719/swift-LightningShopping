//
//  TabBottomView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/10.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit

class TabBottomView: UIView {
    var enterShopItem: UIButton!
    var addShopCartItem: UIButton!
    var shopCartItem: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        enterShopItem = UIButton()
        enterShopItem.setTitle("进店逛逛", for: .normal)
        enterShopItem.setTitleColor(UIColor.orange, for: .normal)
        enterShopItem.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(enterShopItem)
        enterShopItem.setViewStyle(cornerRadius: 6.0, borderColor: UIColor.orange, borderWidth: 0.5)

        
        
        addShopCartItem = UIButton()
        addShopCartItem.backgroundColor = UIColor.yellow
        addShopCartItem.setTitle("加入购物车", for: .normal)
        addShopCartItem.setTitleColor(UIColor.black, for: .normal)
        addShopCartItem.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(addShopCartItem)
        addShopCartItem.setViewStyle(cornerRadius: 6.0, borderColor: UIColor.yellow, borderWidth: 0.5)
        
        
        
        
        shopCartItem = UIButton()
        self.addSubview(shopCartItem)
        
        
        
        enterShopItem.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.width.equalTo(frame.size.width/3)
            make.bottom.equalTo(self).offset(-10)
        }
        
        addShopCartItem.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(enterShopItem)
            make.left.equalTo(enterShopItem.snp.right).offset(20)
            make.width.equalTo(enterShopItem)
            make.bottom.equalTo(enterShopItem)
        }
        
        shopCartItem.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(enterShopItem)
            make.right.equalTo(self).offset(-20)
            make.width.equalTo(30)
            make.bottom.equalTo(addShopCartItem)
        }
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setViewStyle(view: UIView, cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
//        view.layer.cornerRadius = cornerRadius
//        view.layer.borderColor = borderColor.cgColor
//        view.layer.borderWidth = borderWidth
//    }
    


}


extension UIView {
//    func clipView(view: UIView, roundingCorners: UIRectCorner, cornerRadii: CGSize, fillColor: UIColor, strokeColor: UIColor, lineWidth: CGFloat)
//    {
//        let rounded = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerRadii)
//        let shape = CAShapeLayer()
//        shape.path = rounded.cgPath
//        shape.fillColor = fillColor.cgColor
//        shape.strokeColor = strokeColor.cgColor
//        shape.lineWidth = lineWidth
//        view.layer.mask = shape
//        
//    }
    
    
    
    func setViewStyle(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
}
