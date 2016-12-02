//
//  HomeViewController.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/23.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import SwiftyJSON


class HomeViewController: UIViewController {
    var homeCollectionView: HomeCollectionView! = nil
    var homeScrollToTopIndicator: HomeScrollToTopIndicator!
    var addToShopCart: AddToShopCart!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tabbarBgView = UIView(frame: CGRect.init(x: 0, y: 0, width: (self.tabBarController?.tabBar.frame.size.width)!, height: (self.tabBarController?.tabBar.frame.size.height)!))
        tabbarBgView.backgroundColor = UIColor.init(red: 246/255.0, green: 245/255.0, blue: 246/255.0, alpha: 1.0)
        self.tabBarController?.tabBar.insertSubview(tabbarBgView, at: 0)
        
//        self.tabBarController?.tabBar.selectedImageTintColor = UIColor.yellow
        

        
        
//        self.tabBarController?.tabBar.tintColor = UIColor.yellow;
//        self.tabBarController?.tabBar.barTintColor = UIColor.yellow;

        
//        //字体大小，颜色（未被选中时）
//        self.tabBarController?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.black, NSFontAttributeName: UIFont.init(name: "Helvetica", size: 12.0)], for: .normal)
//        
//        //字体大小，颜色（被选中时）
//        self.tabBarController?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.red, NSFontAttributeName: UIFont.init(name: "Helvetica", size: 12.0)], for: .selected)
        
        
//        let ti1 = self.tabBarController?.tabBar.items?[0]
//        
//        
//        ti1?.image = UIImage(named: "home_un_selected_tab")
//        ti1?.selectedImage = UIImage(named: "home_selected_tab")



//        let image = self.tabBarController?.tabBarItem.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
//        self.tabBarItem.selectedImage = image;
        
        
        
        

        
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 255/255.0, green: 233/255.0, blue: 19/255.0, alpha: 1.0)
        
        
        //collectionView
        homeCollectionView = HomeCollectionView(frame: self.view.frame)
        self.view.addSubview(homeCollectionView)
        homeCollectionView.homeBlock = {(isHidden) in
            self.homeScrollToTopIndicator.isHidden = isHidden
        }
        
        
        homeCollectionView.clickItemOfFourSceneListCellBlock = {(tag, data) in
            if tag <= 300 {//进入FourActListDetailViewController
                
            }else {//进入FourActListGoodsDetailViewController
                
            }
        }
        
        
        //NewEveryDayCell
        homeCollectionView.clickItemOfNewEveryDayCellBlock = {(tag, data) in
            if tag == 302 {
                let cigarettePurchasingAgentViewController = CigarettePurchasingAgentViewController()
                self.navigationController?.pushViewController(cigarettePurchasingAgentViewController, animated: true)
            }

        }
        
        
        
        //FourActList
        homeCollectionView.fourActListBlock = {(tag, data) in
            let fourActListDetailViewController = FourActListDetailViewController()
            fourActListDetailViewController.tag = tag
            fourActListDetailViewController.data = data
            fourActListDetailViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(fourActListDetailViewController, animated: true)
        }
        
        homeCollectionView.catListBlock = {(data) in
            let searchGoodsViewController = SearchGoodsViewController()
            searchGoodsViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(searchGoodsViewController, animated: true)
        }
        
        homeCollectionView.headerRefreshBlock =  {() in
            self.reloadData()
        }
        
        
        
        //AddToShopCart
        addToShopCart = AddToShopCart(frame: CGRect.init(x: self.view.frame.size.width-50, y: self.view.frame.size.height-100, width: 40, height: 40))
        addToShopCart.addToShopCartBlock = {() in
            
        }
        self.view.addSubview(addToShopCart)


        
        
        //HomeScrollToTopIndicator
        homeScrollToTopIndicator = HomeScrollToTopIndicator(frame: CGRect.init(x: self.view.frame.size.width-50, y: self.view.frame.size.height-150, width: 40, height: 40))
        homeScrollToTopIndicator.scrollToTopBlock = {() in
            self.homeCollectionView.collectionView.scrollToItem(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
        }
        self.view.addSubview(homeScrollToTopIndicator)
        
        
        //获取数据
        self.reloadData()
        
    }
    
    
    func reloadData() {
        Alamofire.request("http://www.52shangou.com/api/shop.do?ak=aMdi6T4a2kA%3D&dt=1&lid=532210&md=1&pos=&sn=214fc0d61acd0e115a36a5ed432f5083").validate().responseJSON { response in
            self.homeCollectionView.endRefreshing()
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("oneHourBannerData-------:\(json["extra"]["adv"]["oneHourBanner"])")                
                self.homeCollectionView.parseJson(data: json)
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



