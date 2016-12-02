//
//  HJRightTopBarView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/12.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit

class HJRightTopBarView: UIView {
    var changeRightViewStyle: UIButton!
    var isColumn: Bool!//右侧列表是横向的还是列向的
    var allCategory: UIButton!//全部分类
    var generalSort: UIButton!//综合排序
    var isShowCategory: Bool!//是否显示分类列表

    
    //点击 全部分类 和 综合排序
    typealias ShowCategoryBlock = (Int) -> Swift.Void
    var showCategoryBlock: ShowCategoryBlock?
    
    
    //点击时切换右侧视图的展示样式
    typealias ChangeDemonstrationBlock = (Bool) -> Swift.Void
    var changeDemonstrationBlock: ChangeDemonstrationBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 245/255.0, green: 244/255.0, blue: 245/255.0, alpha: 1.0)
        isColumn = false
        isShowCategory = false
        changeRightViewStyle = UIButton()
        changeRightViewStyle.addTarget(self, action: #selector(HJRightTopBarView.changeRightViewDemonstration), for: .touchUpInside)
        changeRightViewStyle.setBackgroundImage(#imageLiteral(resourceName: "column_cell"), for: .normal)
        self.addSubview(changeRightViewStyle)
        
        allCategory = UIButton()
        allCategory.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        allCategory.imageEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0)
        allCategory.setImage(UIImage(named:"filterArrowDown"), for: .normal)
        allCategory.tag = 100
        allCategory.setTitle("全部分类", for: .normal)
        allCategory.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        allCategory.addTarget(self, action: #selector(HJRightTopBarView.showCategory), for: .touchUpInside)
        allCategory.setTitleColor(UIColor.black, for: .normal)
        self.addSubview(allCategory)
        
        
        
        generalSort = UIButton()
        generalSort.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        generalSort.imageEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0)
        generalSort.setImage(UIImage(named:"filterArrowDown"), for: .normal)
        generalSort.tag = 101
        generalSort.setTitle("综合排序", for: .normal)
        generalSort.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        generalSort.addTarget(self, action: #selector(HJRightTopBarView.showCategory), for: .touchUpInside)
        generalSort.setTitleColor(UIColor.black, for: .normal)
        self.addSubview(generalSort)
        
        
        changeRightViewStyle.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-10)
            make.width.equalTo(self.frame.size.height-20)
            make.top.equalTo(10)
            make.bottom.equalTo(self).offset(-10)
        }
        
        
        generalSort.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(changeRightViewStyle.snp.left).offset(-10)
            make.width.equalTo((self.frame.size.width-self.frame.size.height)/2)
            make.top.bottom.equalTo(self)
        }
        
        allCategory.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(generalSort.snp.left)
            make.top.bottom.equalTo(self)
            make.left.equalTo(self)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 改变右侧视图的显示样式
    func changeRightViewDemonstration(sender: UIButton) {
        if isColumn == true {
            changeRightViewStyle.setBackgroundImage(#imageLiteral(resourceName: "column_cell"), for: .normal)
        }else {
            changeRightViewStyle.setBackgroundImage(#imageLiteral(resourceName: "row_cell"), for: .normal)
        }
        isColumn = !isColumn
        self.changeDemonstrationBlock!(isColumn)
    }
    
    //MARK: - 显示全部分类
    func showCategory(sender: UIButton) {
        isShowCategory = !isShowCategory
        self.changeIndicatorDirection(sender: sender)
        showCategoryBlock!(sender.tag)
    }
    
    //MARK: - 选择完category中的item后，更新tab的标题
    func changeTabItemName(name: String) {
        allCategory.setTitle(name, for: .normal)
    }
    
    //MARK: - 改变右侧tab指示箭头的方向
    func changeIndicatorDirection(sender: UIButton) {
        if isShowCategory == true {
            sender.setImage(UIImage(named:"filterArrowUp"), for: .normal)
        }else {
            sender.setImage(UIImage(named:"filterArrowDown"), for: .normal)
        }
    }


}
