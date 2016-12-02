//
//  ChangeGoodsNumberView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/8.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit

class ChangeGoodsNumberView: UIView {
    
    var add: UIButton!
    var reduce: UIButton!
    var number: UILabel!
    
    typealias ChangeGooodsNumberBlock = (_ tag: Int) -> Swift.Void
    var changeGooodsNumberBlock: ChangeGooodsNumberBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        self.layer.borderColor = UIColor.init(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
        
        reduce = UIButton()
        reduce.tag = 200
        reduce.backgroundColor = UIColor.init(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        reduce.setBackgroundImage(UIImage(named: "reduce_goods"), for: .normal)
        reduce.addTarget(self, action: #selector(ChangeGoodsNumberView.changeGoodsNumber), for: .touchUpInside)
        self.addSubview(reduce)
        
        number = UILabel()
        number.backgroundColor = UIColor.init(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        number.font = UIFont.systemFont(ofSize: 14)
        number.textColor = UIColor.red
        number.textAlignment = .center
        self.addSubview(number)
        
        add = UIButton()
        add.tag = 201
        add.backgroundColor = UIColor.init(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        add.setBackgroundImage(UIImage(named: "add_goods"), for: .normal)
        add.addTarget(self, action: #selector(ChangeGoodsNumberView.changeGoodsNumber), for: .touchUpInside)
        self.addSubview(add)
        

        
        

        
        
        reduce.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(5)
            make.width.equalTo(15)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
        }
        
        add.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-5)
            make.width.equalTo(15)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
        }
        
        number.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(reduce.snp.right)
            make.right.equalTo(add.snp.left)
            make.top.bottom.equalTo(self)
        }

    }
    
    //MARK: - Action
    func changeGoodsNumber(sender: UIButton) {
        print("tag------------:\(sender.tag)")
        changeGooodsNumberBlock!(sender.tag)
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
