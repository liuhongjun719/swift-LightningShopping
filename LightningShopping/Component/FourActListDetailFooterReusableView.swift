//
//  FourActListDetailFooterReusableView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/8.
//  Copyright © 2016年 123456. All rights reserved.
//

import Foundation
import UIKit


class FourActListDetailFooterReusableView: UICollectionReusableView {
    var rule: UILabel!
    var footer: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        
        
        footer = UIButton()
        footer.setTitle("客服电话： 400-091-1717", for: .normal)
        footer.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(footer)
        
        rule = UILabel()
        rule.numberOfLines = 0
        rule.textColor = UIColor.white
//        rule.backgroundColor = UIColor.yellow
        rule.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(rule)
        
        
        footer.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(30)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.bottom.equalTo(self)
        }
        rule.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(footer.snp.top)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
