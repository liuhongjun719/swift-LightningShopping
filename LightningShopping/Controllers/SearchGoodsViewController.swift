//
//  SearchGoodsViewController.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/11.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchGoodsViewController: ParentViewController {
    
    var scrollableContainerView: HJScrollableContainerView!
    var leftUrl: String!//首次进入界面时要获取左侧数据的url
    var rightUrl: String!//首次进入界面时要获取的右侧数据的url
    var row: Int!//保存点击左侧cell的row
    var leftData: JSON?//保存被点击的左侧cell对应的数据
    var page: Int!//右侧视图上拉加载的当前页


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.row = 0
        self.page = 0
        let childCatIds = ["1","1","30","37","38","54","215","71","55%2C58","121%2C126","96%2C97","111","51",]
        
        
        
        scrollableContainerView = HJScrollableContainerView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        self.view.addSubview(scrollableContainerView)
        


        //点击左侧cell时执行
        scrollableContainerView.clickLeftRowBlock = {(row, data) in
            if self.row != row {//不属于同一类，不属于同一类时将接口中的page清0
                self.page = 0
            }
            self.row = row
            self.leftData = data
            let url = String.init(format: "http://www.52shangou.com/itemcenter//buyer/open/item/categoryItem/multi_childcats_page_v2.json?&pageSize=20&sortBy=0&shopIds=16928&childCatIds=%@&parentCatId=%@&offset=%@", childCatIds[row], data["cat"]["id"].stringValue, String.init(format: "%@", String(self.page*10)))
            print("click___cell--------:\(url)")
            Alamofire.request(url).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.scrollableContainerView.setRightViewData(data: json, row: row)
                case .failure(let error):
                    print(error)
                }
            }
        }

        //点击右侧cell 
        scrollableContainerView.showGoodsDetailBlock = {(data) in
            let fourActListGoodsDetailViewController = FourActListGoodsDetailViewController()
            fourActListGoodsDetailViewController.data = data
            fourActListGoodsDetailViewController.isFromSearchGoods = true
            self.navigationController?.pushViewController(fourActListGoodsDetailViewController, animated: true)
        }
        
        //右侧视图上拉加载下一页数据
        scrollableContainerView.loadNextPageDataBlock = {(page) in
            self.page = page
            let url = String.init(format: "http://www.52shangou.com/itemcenter//buyer/open/item/categoryItem/multi_childcats_page_v2.json?&pageSize=20&sortBy=0&shopIds=16928&childCatIds=%@&parentCatId=%@&offset=%@", childCatIds[self.row], (self.leftData?["cat"]["id"].stringValue)!, String.init(format: "%@", String(self.page*10)))
            print("loadMore___url----------:\(url)")
            Alamofire.request(url).validate().responseJSON { response in
                self.scrollableContainerView.endRefreshing()
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.scrollableContainerView.setRightViewData(data: json, row: self.row)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        //点击category中的item时重新加载界面
        scrollableContainerView.didSelectItemOfCategoryBlock = {(data) in
            self.page = 0
            let url = String.init(format: "http://www.52shangou.com/itemcenter//buyer/open/item/categoryItem/multi_childcats_page_v2.json?&pageSize=20&sortBy=0&shopIds=16928&childCatIds=%@&parentCatId=%@&offset=%@", data["id"].stringValue, data["parentId"].stringValue, String.init(format: "%@", String(self.page*10)))
            print("loadMore___url----------:\(url)")
            Alamofire.request(url).validate().responseJSON { response in
                self.scrollableContainerView.endRefreshing()
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.scrollableContainerView.setRightViewData(data: json, row: self.row)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        
        //首次运行
        self.firstLaunch()
       

    }
    
    //首次运行
    func firstLaunch() {
        leftUrl = "http://www.52shangou.com/itemcenter/buyer/open/item/categoryItem/init_v2.json?shopIds=16928"
        rightUrl = "http://www.52shangou.com/itemcenter//buyer/open/item/categoryItem/multi_childcats_page_v2.json?childCatIds=1&offset=0&pageSize=20&parentCatId=149&shopIds=16928&sortBy=0"
        Alamofire.request(leftUrl).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.scrollableContainerView.setLeftViewData(data: json)
                self.leftData = json["entry"]["cats"].arrayValue[0]
                
            case .failure(let error):
                print(error)
            }
        }
        
        Alamofire.request(rightUrl).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.scrollableContainerView.setRightViewData(data: json, row: self.row)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 255/255.0, green: 233/255.0, blue: 19/255.0, alpha: 1.0)
    }

}
