//
//  HJCategoryView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/12.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit

class HJCategoryView: UIView {
    var changeRightViewStyle: UIButton!
    var isColumn: Bool!
    
    typealias ChangeDemonstrationBlock = (Bool) -> Swift.Void
    var changeDemonstrationBlock: ChangeDemonstrationBlock?//点击时切换右侧视图的展示样式
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 245/255.0, green: 244/255.0, blue: 245/255.0, alpha: 1.0)
        isColumn = false
        changeRightViewStyle = UIButton()
        changeRightViewStyle.addTarget(self, action: #selector(HJRightTopBarView.changeRightViewDemonstration), for: .touchUpInside)
        changeRightViewStyle.setBackgroundImage(#imageLiteral(resourceName: "column_cell"), for: .normal)
        self.addSubview(changeRightViewStyle)
        
        
        changeRightViewStyle.snp.makeConstraints { (make) -> Void in
            make.right.height.equalTo(self)
            make.width.equalTo(self.frame.size.height)
            make.top.equalTo(0)
            make.bottom.equalTo(self)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeRightViewDemonstration(sender: UIButton) {
        if isColumn == true {
            changeRightViewStyle.setBackgroundImage(#imageLiteral(resourceName: "column_cell"), for: .normal)
        }else {
            changeRightViewStyle.setBackgroundImage(#imageLiteral(resourceName: "row_cell"), for: .normal)
        }
        isColumn = !isColumn
        self.changeDemonstrationBlock!(isColumn)
    }
    
}
