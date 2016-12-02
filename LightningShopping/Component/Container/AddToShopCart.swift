//
//  AddToShopCart.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/18.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit

class AddToShopCart: UIView {
    var addToShopCart: UIButton!
    
    //使视图滚动到最上面
    typealias AddToShopCartBlock = () -> Swift.Void
    var addToShopCartBlock: AddToShopCartBlock!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addToShopCart = UIButton(frame: self.bounds)
        addToShopCart.backgroundColor = UIColor.init(red: 254/255.0, green: 254/255.0, blue: 254/255.0, alpha: 1.0)
        addToShopCart.layer.masksToBounds = true
        addToShopCart.layer.borderColor = UIColor.lightGray.cgColor
        addToShopCart.layer.cornerRadius = 20
        addToShopCart.layer.borderWidth = 0.5
        addToShopCart.setBackgroundImage(UIImage.init(named: "cart_selected"), for: .normal)
        addToShopCart.setBackgroundImage(UIImage.init(named: "cart_normal"), for: .selected)
        addToShopCart.addTarget(self, action: #selector(AddToShopCart.addShopCart), for: .touchUpInside)
        self.addSubview(addToShopCart)
        self.isHidden = false
        
        
    }
    
    //MARK: - Action
    public func addShopCart() {
        addToShopCartBlock()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
