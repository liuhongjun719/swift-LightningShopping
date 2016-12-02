//
//  HJRightScrollview.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/11.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJRefresh

class HJRightScrollview: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var rightCollectionView: UICollectionView! = nil

    
    
    var isColumn: Bool? //用于判断展示的样式
    var dataArray: [JSON]?//保存右侧视图数据
    
    var page: Int!//右侧视图上拉加载的当前页
    var row: Int!//保存点击左侧cell时的row

    //点击cell进入商品详情
    typealias ShowGoodsDetailBlock = (_ data: JSON) -> Swift.Void
    var showGoodsDetailBlock: ShowGoodsDetailBlock?
    
    //加载下一页数据
    typealias LoadNextPageDataBlock = (_ page: Int) -> Swift.Void
    var loadNextPageDataBlock: LoadNextPageDataBlock?
    
    
    //MARK: - UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        dataArray = Array()
        page = 0
        row = -1
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .vertical;
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        rightCollectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height), collectionViewLayout: layout);
//        rightCollectionView.backgroundColor = UIColor.clear
        rightCollectionView.backgroundColor = UIColor.init(red: 245/255.0, green: 244/255.0, blue: 245/255.0, alpha: 1.0)

        rightCollectionView.delegate = self;
        rightCollectionView.dataSource = self;
        self.addSubview(rightCollectionView)
        
        rightCollectionView.register(HJRightColumnCell.self, forCellWithReuseIdentifier: "HJRightColumnCell")
        rightCollectionView.register(HJRightRowCell.self, forCellWithReuseIdentifier: "HJRightRowCell")

        self.addLoadFooter()
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataArray != nil {
            return dataArray!.count
        }
        return 0

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.isColumn == true {
            let identifier = "HJRightColumnCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HJRightColumnCell
            cell.data = (dataArray?[indexPath.row])!
            return cell;
        }else{
            let identifier = "HJRightRowCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HJRightRowCell
            cell.data = (dataArray?[indexPath.row])!
            return cell;
        }
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isColumn == true {
            return CGSize(width: rightCollectionView.frame.size.width/2, height: 220)
        }else {
            return CGSize(width: rightCollectionView.frame.size.width, height: 100)
        }
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.showGoodsDetailBlock!((self.dataArray?[indexPath.row])!)
    }
    
    
    
    
    //MARK: - 加载数据
    func setRightData(data: JSON, row: Int) {
        if row == self.row {//属于同一类
            dataArray! += data.arrayValue
            rightCollectionView.reloadData()
        }else {//不属于同一类
            self.row = row
            dataArray! = data.arrayValue
            rightCollectionView.reloadData()
        }
    }
    
    //MARK: - 改变右侧视图展示样式
    func changeDemonstration(isColumn: Bool) {
        self.isColumn = isColumn
        rightCollectionView.reloadData()
    }
    
    
    //MARK: -footer
    func addLoadFooter() {
        let footer = MJRefreshAutoNormalFooter.init {
            self.page! += 1
            self.loadNextPageDataBlock!(self.page)
        }
        footer?.setTitle("加载中", for: MJRefreshState.refreshing)
        footer?.setTitle("", for: MJRefreshState.noMoreData)
        footer?.setTitle("", for: MJRefreshState.idle)

        footer?.stateLabel.font = UIFont.systemFont(ofSize: 12)
        footer?.stateLabel.textColor = UIColor.black
        self.rightCollectionView.mj_footer = footer
    }

    
    func endRefreshing() {
        self.rightCollectionView.mj_footer.endRefreshing()
    }
    
  
    
    
    
}
