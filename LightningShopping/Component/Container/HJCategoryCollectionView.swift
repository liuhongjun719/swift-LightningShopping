//
//  HJCategoryCollectionView.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/12.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON

class HJCategoryCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var collectionView: UICollectionView! = nil
    var data: JSON?
    
    var blankBack: UIButton!//半透明view


    
    //点击item
    typealias DidSelectItem = (_ data: JSON) -> Swift.Void
    var didSelectItem:DidSelectItem?
    
    //点击blank
    typealias DidClickBlankBlock = () -> Swift.Void
    var didClickBlankBlock: DidClickBlankBlock?
    
    
    
    //MARK: - UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .vertical;
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height-300), collectionViewLayout: layout);
        collectionView.backgroundColor = UIColor.white
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.bounces = false
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionFooter", withReuseIdentifier:"UICollectionReusableView")

        collectionView.register(HJCategoryCell.self, forCellWithReuseIdentifier: "HJCategoryCell")
        self.addSubview(collectionView)
        
        blankBack = UIButton()
        blankBack.frame = CGRect.init(x: collectionView.frame.origin.x, y: collectionView.frame.origin.y+collectionView.frame.size.height, width: collectionView.frame.size.width, height: 300)
        blankBack.alpha = 0.3
        blankBack.backgroundColor = UIColor.black
        blankBack.addTarget(self, action: #selector(HJCategoryCollectionView.clickBlank), for: .touchUpInside)
        self.addSubview(blankBack)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.data != nil {
            return (self.data?.count)!
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "HJCategoryCell";
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HJCategoryCell;
        cell.data = (self.data?.arrayValue[indexPath.row].dictionary?["cat"])!
        return cell;
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width-UIScreen.main.bounds.size.width/5)/3, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didClickBlankBlock!()
        self.didSelectItem!((self.data?.arrayValue[indexPath.row].dictionary?["cat"])!)
    }
    
    
    //MARK: - parse data
    public func parseJson(data: JSON) {
        self.data = data
        collectionView.reloadData()
    }
    
    //MARK: - blank
    func clickBlank(sender: UIButton) {
        self.didClickBlankBlock!()
    }
    
    


    
    
}
