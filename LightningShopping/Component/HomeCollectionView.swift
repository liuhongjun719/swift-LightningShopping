//
//  HomeCollectionView.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/28.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON
import DGElasticPullToRefresh
import MJRefresh


class HomeCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    //refresh
    typealias HeaderRefreshBlock = () -> Swift.Void
    var headerRefreshBlock: HeaderRefreshBlock!
    
    
    
    var collectionView: UICollectionView! = nil
    
    //saved data
    var oneHourBannerData: JSON!//1
    var toolData: JSON!//2
    var fourActListData: JSON!//3
    var fourSceneListData: JSON!//4 ok
    var newEveryDayData: JSON!//5
    var catListData: JSON!//6
    
    
    //FourActListCell block
    typealias FourActListBlock = (_ tag: Int, _ data: JSON) -> Swift.Void
    var fourActListBlock: FourActListBlock!
    
    //CatListCell block
    typealias CatListBlock = (_ data: JSON) -> Swift.Void
    var catListBlock: CatListBlock!
    
    
    //NewEveryDayCell block
    typealias ClickItemOfNewEveryDayCellBlock = (_ tag: Int, _ data: JSON) -> Swift.Void
    var clickItemOfNewEveryDayCellBlock: ClickItemOfNewEveryDayCellBlock?
    
    //FourSceneListCell
    typealias ClickItemOfFourSceneListCellBlock = (_ tag: Int, _ data: JSON) -> Swift.Void
    var clickItemOfFourSceneListCellBlock: ClickItemOfFourSceneListCellBlock?
    
  
    
    //创建block变量
    typealias ScrollViewDidScrollOfHomeBlock = (_ isHidden: Bool) -> Swift.Void
    var homeBlock:ScrollViewDidScrollOfHomeBlock!

    
    //MARK: - UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .vertical;
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout);
        collectionView.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(CatListHeaderReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier:"Header")
        collectionView.register(FourActListHeaderReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier:"FourActListHeaderReusableView")
        
        collectionView.register(FourActListFooterReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionFooter", withReuseIdentifier:"FourActListFooterReusableView")
        
        
        
        collectionView.register(OneHourBannerCell.self, forCellWithReuseIdentifier: "OneHourBannerCell")
        collectionView.register(ToolCell.self, forCellWithReuseIdentifier: "ToolCell")
        collectionView.register(FourActListCell.self, forCellWithReuseIdentifier: "FourActListCell")
        
        collectionView.register(FourSceneListCell.self, forCellWithReuseIdentifier: "FourSceneListCell")
        collectionView.register(NewEveryDayCell.self, forCellWithReuseIdentifier: "NewEveryDayCell")
        collectionView.register(CatListCell.self, forCellWithReuseIdentifier: "CatListCell")
        self.addSubview(collectionView)
        
        
        self.addRefreshHeader()
    }
    
    func addRefreshHeader() {
        let header = MJHomeDogHeader.init {
            self.headerRefreshBlock()
        }
        // 隐藏时间
        header?.lastUpdatedTimeLabel.isHidden = true;
        // 隐藏状态
        header?.stateLabel.isHidden = true;
        // 马上进入刷新状态
//        header?.beginRefreshing()
        // 设置header
        self.collectionView.mj_header = header
    }
    


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


  
    //MARK: - Parse json data
    public func parseJson(data: JSON) {
        self.oneHourBannerData = data["extra"]["adv"]["oneHourBanner"]
        
        self.toolData = data["extra"]["adv"]["tool"]
        
        self.fourActListData = data["extra"]["adv"]["fourActList"]

        self.fourSceneListData = data["extra"]["adv"]["fourSceneList"]
        
        self.newEveryDayData = data["extra"]["adv"]["newEveryDay"]
        
        self.catListData = data["extra"]["adv"]["catList"]
        
        collectionView.reloadData()
    }

    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            if self.oneHourBannerData != nil {
                return 1
            }
            return 0
        }else if section == 1 {
            if self.toolData != nil  {
                return self.toolData.count
            }
            return 0
        }else if section == 2 {
            if self.fourActListData != nil {
                return 1
            }
            return 0
        }else if section == 3 {
            if self.fourSceneListData != nil {
                return self.fourSceneListData.count
            }
            return 0
        }else if section == 4 {
            if self.newEveryDayData != nil {
                return 1
            }
            return 0
        }else if section == 5 {
            if self.catListData != nil {
                return self.catListData.count
            }
            return 0
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {
            let identifier = "OneHourBannerCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! OneHourBannerCell;
            cell.oneHourBanner(data: self.oneHourBannerData!)
            return cell;
        }
        else if indexPath.section == 1 {
            let identifier = "ToolCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ToolCell;
            
            let dict = self.toolData.dictionaryValue
            var array = [String]()
            for k in dict.keys {
                array.append(k)
            }
            let key = array[indexPath.row]
            cell.tool(data: (dict["\(key)"]?.dictionaryValue)!)
            
            return cell;
        }
        else if indexPath.section == 2 {
            let identifier = "FourActListCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FourActListCell;
            cell.fourActList(data: self.fourActListData)
            cell.fourActListBlock = {(tag, data) in
                self.fourActListBlock(tag, data)
            }

            return cell;
        }
        else if indexPath.section == 3 {
            let identifier = "FourSceneListCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FourSceneListCell;

            let dict = self.fourSceneListData.dictionaryValue
            var array = [String]()
            for k in dict.keys {
                array.append(k)
            }
            let key = array[indexPath.row]
            cell.fourSceneList(data: dict["\(key)"]!)
            cell.clickItemOfFourSceneListCellBlock = {(tag, data) in
                self.clickItemOfFourSceneListCellBlock!(tag, data)
            }

            return cell;
        }
        else if indexPath.section == 4{
            let identifier = "NewEveryDayCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! NewEveryDayCell;
            cell.newEveryDay(data: self.newEveryDayData)
            cell.clickItemOfNewEveryDayCellBlock = {(tag, data) in
                self.clickItemOfNewEveryDayCellBlock!(tag, data)
            }
            
            return cell;
        }
        else {
            let identifier = "CatListCell";
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CatListCell;
            
            let dict = self.catListData.dictionaryValue
            var array = [String]()
            for k in dict.keys {
                array.append(k)
            }
            let key = array[indexPath.row]
            cell.catList(data: dict["\(key)"]!)
            
            
            return cell;
        }
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {//
            return CGSize(width: self.frame.size.width, height: 120)
        }else if indexPath.section == 1 {//
            return CGSize(width: self.frame.size.width/4, height: self.frame.size.width/4)
        }else if indexPath.section == 2 {
            return CGSize(width: self.frame.size.width, height: 230)
        }else if indexPath.section == 3 {//FourSceneListCell
            return CGSize(width: self.frame.size.width, height: 300)
        }else if indexPath.section == 4 {//NewEveryDayCell
            return CGSize(width: self.frame.size.width, height: 230)
        }else if indexPath.section == 5 {//
            return CGSize(width: self.frame.size.width/4, height: self.frame.size.width/4+20)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 5 {
            return CGSize.init(width: UIScreen.main.bounds.size.width, height: 30)
        }
        if section == 2 {
            return CGSize.init(width: UIScreen.main.bounds.size.width, height: 10)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var resuableView: UICollectionReusableView?
        if kind == "UICollectionElementKindSectionHeader"  {
            if indexPath.section == 5 {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader" , withReuseIdentifier: "Header", for: indexPath) as? CatListHeaderReusableView
                view?.headerTitle.text = "- 分类精选 -"                
                resuableView = view
            }else if indexPath.section == 2 {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader" , withReuseIdentifier: "FourActListHeaderReusableView", for: indexPath) as? FourActListHeaderReusableView
                resuableView = view
            }
        }else if kind == "UICollectionElementKindSectionFooter" {
            if indexPath.section == 5 {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionFooter" , withReuseIdentifier: "FourActListFooterReusableView", for: indexPath) as? FourActListFooterReusableView
                resuableView = view
            }
        }
        return resuableView!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 5 {
            return CGSize.init(width: UIScreen.main.bounds.size.width, height: 60)
        }
        return CGSize.zero
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 5 {
            let dict = self.catListData.dictionaryValue
            var array = [String]()
            for k in dict.keys {
                array.append(k)
            }
            let key = array[indexPath.row]
            if catListBlock != nil {
                catListBlock( dict["\(key)"]!)
            }
        }else if indexPath.section == 4 {
        }
        
    }
    
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 500 {
            homeBlock(false)
        }else {
            homeBlock(true)
        }
    }
    
    
    
    //MARK: - 刷新
    func endRefreshing() {
        collectionView.mj_header.endRefreshing()
    }


    


}
