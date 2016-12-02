//
//  HJScrollableContainerView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/11.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON

class HJScrollableContainerView: UIView {
    
    //MARK: -左侧视图
    var leftScrollView: HJLeftScrollview!//左边滚动视图
    var leftData: JSON?//左侧加载数据
    typealias ClickLeftRowBlock = (Int, JSON) -> Swift.Void//点击左侧cell
    var clickLeftRowBlock: ClickLeftRowBlock?
    var row: Int!//保存点击左侧cell时的row


    
    //MARK: -右侧边视图
    var rightScrollView: HJRightScrollview!//右边滚动视图
    typealias ShowGoodsDetailBlock = (_ data: JSON) -> Swift.Void//进入商品详情
    var showGoodsDetailBlock: ShowGoodsDetailBlock?
    var page: Int!//右侧视图上拉加载的当前页
    typealias LoadNextPageDataBlock = (_ page: Int) -> Swift.Void//加载下一页数据
    var loadNextPageDataBlock: LoadNextPageDataBlock?
    
    
    //MARK: -右侧topBar
    var rightTopBar: HJRightTopBarView!
    
    
    
    //MARK: -分类列表category
    var categoryCollectionView: HJCategoryCollectionView!//条件筛选分类列表
    var categoryData: JSON?//全部分类的数据
    var generalSortData: JSON?//综合排序的数据
    typealias DidSelectItemOfCategoryBlock = (_ data: JSON) -> Swift.Void//进入商品详情
    var didSelectItemOfCategoryBlock: DidSelectItemOfCategoryBlock?
    


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        row = -1
        page = 0
        /*HJLeftScrollview*/
        leftScrollView = HJLeftScrollview(frame: CGRect.init(x: 0, y: 0, width: frame.size.width/5, height: frame.size.height))
        leftScrollView.backgroundColor = UIColor.white
        self.addSubview(leftScrollView)
        self.clipView()
        
        //点击左侧cell
        leftScrollView.clickLeftRowBlock = {(row, data) in
            self.row = row
            self.clickLeftRowBlock!(row, data)
            self.categoryCollectionView.isHidden = true
            
        }

        
        
        /*HJRightScrollview*/
        rightScrollView = HJRightScrollview(frame: CGRect.init(x: leftScrollView.frame.origin.x + leftScrollView.frame.size.width, y: leftScrollView.frame.origin.y+64+40, width: frame.width - leftScrollView.frame.size.width, height: frame.size.height-64-40))
        rightScrollView.backgroundColor = UIColor.white
        self.addSubview(rightScrollView)
        rightScrollView.showGoodsDetailBlock = {(data) in
            self.showGoodsDetailBlock!(data)
        }
        rightScrollView.loadNextPageDataBlock = {(page) in
            self.page = page
            self.loadNextPageDataBlock!(page)
        }
        
        
        
        
        /*HJRightTopBarView*/
        rightTopBar = HJRightTopBarView(frame: CGRect.init(x: rightScrollView.frame.origin.x, y: rightScrollView.frame.origin.y-40, width: rightScrollView.frame.size.width, height: 40))
        self.addSubview(rightTopBar)
        
        //改变右侧列表显示样式的按钮
        rightTopBar.changeDemonstrationBlock = {(isColumn) in
            self.rightScrollView.changeDemonstration(isColumn: isColumn)
            self.categoryCollectionView.isHidden = true
        }

        //点击 全部分类 或 综合排序
        rightTopBar.showCategoryBlock = {(tag) in
            if self.categoryCollectionView.isHidden {
                self.categoryCollectionView.isHidden = false
                self.categoryData = self.leftData?["entry"]["cats"]
                self.categoryCollectionView.parseJson(data: (self.categoryData?.arrayValue[self.row].dictionary?["children"])!)
            }else {
                self.categoryCollectionView.isHidden = true
            }
//            self.categoryCollectionView.frame = CGRect.init(x: self.categoryCollectionView.frame.origin.x, y: self.categoryCollectionView.frame.origin.y, width: self.categoryCollectionView.frame.size.width, height: 100)
        }
        
        
        
        
        /*HJCategoryCollectionView*/
        categoryCollectionView = HJCategoryCollectionView(frame: CGRect.init(x: rightTopBar.frame.origin.x, y: rightTopBar.frame.origin.y+rightTopBar.frame.size.height, width: rightTopBar.frame.size.width, height: rightScrollView.frame.size.height))
        self.categoryCollectionView.isHidden = true
        self.addSubview(categoryCollectionView)
        
        //点击blank
        categoryCollectionView.didClickBlankBlock = {() in
            self.setCategoryViewState()
        }
        
        categoryCollectionView.didSelectItem = {(data) in
            self.rightTopBar.changeTabItemName(name: data["name"].stringValue)
            self.didSelectItemOfCategoryBlock!(data)
            self.rightScrollView.dataArray?.removeAll()
        }
        
    }
    
    //添加左侧view的纵向分割线
    func clipView() {
        let path = UIBezierPath(rect: CGRect.init(x: leftScrollView.frame.size.width-0.5, y: leftScrollView.frame.origin.y, width: 1, height: leftScrollView.frame.size.height))
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 142/255.0, alpha: 0.5).cgColor
        leftScrollView.layer.addSublayer(layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 设置 左侧列表 和 右侧列表 中的数据
    func setLeftViewData(data: JSON) {
        self.leftData = data
        leftScrollView.setLeftData(data: data["entry"]["cats"])
    }
    
    func setRightViewData(data: JSON, row: Int) {
        self.row = row
        rightScrollView.setRightData(data: data["entry"].arrayValue[0].dictionaryValue["catItemList"]!, row: row)
    }
    

    
    //MARK: - 设置category的显示或者隐藏
    func setCategoryViewState() {
        if self.categoryCollectionView.isHidden {
            self.categoryCollectionView.isHidden = false
        }else {
            self.categoryCollectionView.isHidden = true
        }
    }
    
    //MARK: - 界面加载
    func endRefreshing() {
        self.rightScrollView.endRefreshing()
    }
    
    
    

}
