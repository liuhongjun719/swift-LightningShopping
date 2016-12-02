//
//  HomeScrollToTopIndicator.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/28.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit

class HomeScrollToTopIndicator: UIView {
    var scrollToTopButton: UIButton!
    
    //使视图滚动到最上面
    typealias ScrollToTopBlock = () -> Swift.Void
    var scrollToTopBlock: ScrollToTopBlock!

    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollToTopButton = UIButton(frame: self.bounds)
        scrollToTopButton.backgroundColor = UIColor.init(red: 254/255.0, green: 254/255.0, blue: 254/255.0, alpha: 1.0)
        scrollToTopButton.layer.masksToBounds = true
        scrollToTopButton.layer.borderColor = UIColor.lightGray.cgColor
        scrollToTopButton.layer.cornerRadius = 20
        scrollToTopButton.layer.borderWidth = 0.5
        scrollToTopButton.setBackgroundImage(UIImage.init(named: "scroll_to_top.png"), for: .normal)
        scrollToTopButton.addTarget(self, action: #selector(HomeScrollToTopIndicator.scrollToTop), for: .touchUpInside)
        self.addSubview(scrollToTopButton)
        self.isHidden = true

        
    }
    
    //MARK: - Action
    public func scrollToTop() {
        print("--------------44--------")
        scrollToTopBlock()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
