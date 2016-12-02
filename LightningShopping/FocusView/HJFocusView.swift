//
//  HJFocusView.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/27.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SwiftyJSON

class HJFocusView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var collectionView: UICollectionView!
    var timer: Timer?
    //    var pageControl: UIPageControl?
//    var imageNames: Array<String>?
//    var imageNames: NSMutableArray?

    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: self.frame.size.height-20, width: self.frame.size.width, height: 20))
        return pageControl
    }()
    
    var imageDic: JSON?
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView = UICollectionView.init(frame: frame, collectionViewLayout: self.getFlowLayout())
        collectionView.backgroundColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        self.addSubview(collectionView)

        
        collectionView.register(FocusCell.self, forCellWithReuseIdentifier: "FocusCell")
        

        collectionView.reloadData()
        
//        self.addSubview(pageControl)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = .zero
        return flowLayout
    }
    

    
    
    //MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imageDic?.count)!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as! FocusCell;
        
        let dict = imageDic?.dictionaryValue
        var array = [String]()
        for k in (dict?.keys)! {
            array.append(k)
        }
        let key = array[indexPath.row]
        cell.setHeaderData(data: (dict?["\(key)"])!)

        return cell;
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.size.width, height: 150)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        self.removeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        self.addTimer()
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        self.adjustPageWithScrollView(scrollView: scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        self.adjustPageWithScrollView(scrollView: scrollView)
    }
    
    private func adjustPageWithScrollView(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / collectionView.bounds.size.width)
        if index == 0 {
            scrollView.setContentOffset(CGPoint.init(x: Int(Float(((imageDic?.count)! - 2)) * Float(collectionView.bounds.size.width)), y: 0), animated: false)
//            pageControl.currentPage = (imageNames?.count)! - 2
            
        }else if index == ((imageDic?.count)!-1) {
            scrollView.setContentOffset(CGPoint.init(x: collectionView.bounds.size.width, y: 0), animated: false)
//            pageControl.currentPage = 0;
        }else {
//            pageControl.currentPage = index - 1;
            
        }
    }
    
    func nextPage() {
        var index = Int(collectionView.contentOffset.x / collectionView.bounds.size.width)
        index += 1
        collectionView.setContentOffset(CGPoint.init(x: index * Int(collectionView.bounds.size.width), y: 0), animated: true)

    }
 
    
    //MARK: - Public method
    public func addTimer() {
        if timer != nil {
            self.removeTimer()
        }
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(HJFocusView.nextPage), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .commonModes)
    }
    
    public func removeTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    public func setContentOffset() {
        collectionView.setContentOffset(CGPoint.init(x: UIScreen.main.bounds.size.width, y: 0), animated: false)
    }
    
    
    
//    public func getHeaderData(data: NSDictionary) {
//        imageDic = data
//        collectionView.reloadData()
//    }
    
    public func getHeaderData(data: JSON) {
        imageDic = data
        collectionView.reloadData()
    }
    
    
    
}
