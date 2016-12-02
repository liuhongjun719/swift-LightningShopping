//
//  MJHomeDogHeader.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/13.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import MJRefresh


class MJHomeDogHeader: MJRefreshGifHeader {
    override func prepare() {
        super.prepare()
        
        // 设置普通状态的动画图片
        var idleImages = [Any]()
        idleImages.append(UIImage(named: "pull_1")!)
        self.setImages(idleImages, for: MJRefreshState.idle)
        
        //设置即将刷新状态的动画图片
        var pullingImages = [Any]()
        pullingImages.append(UIImage(named: "pull_2")!)
        self.setImages(pullingImages, for: MJRefreshState.pulling)
        
        // 设置正在刷新状态的动画图片
        var refreshingImages = [Any]()
        for index in 1...7 {
            refreshingImages.append(UIImage(named: String.init(format: "anim_%i", index))!)
        }
        self.setImages(refreshingImages, for: MJRefreshState.refreshing)
//        self.gifView.frame = CGRect.init(x: self.gifView.frame.origin.x, y: self.gifView.frame.origin.y, width: 40, height: 40)
    }
    
    
    override func placeSubviews() {
        super.placeSubviews()
    }
    
}



