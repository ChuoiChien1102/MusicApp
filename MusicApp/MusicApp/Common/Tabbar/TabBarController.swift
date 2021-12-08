//
//  TabBarController.swift
//  RingtoneZ
//
//  Created by ChuoiChien on 5/9/19.
//  Copyright © 2019 ChuoiChien. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        setupTabbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.backgroundColor = UIColor.tabbarColor()
        self.tabBar.alpha = 1
        self.tabBar.unselectedItemTintColor = UIColor.grayTextColor()
        self.tabBar.tintColor = UIColor.boldTextColor()
        self.tabBar.isTranslucent = false
    }
    
    func setupTabbar() {
        
        // Create Tab one
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let tabOne = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        let tabOneBarItem = createTabbarItemWith(title: "Trang chủ", image: "ic_tabbar_home", selectedImage: "ic_tabbar_home_selected")
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab Two
        let tabTwo = storyboard.instantiateViewController(withIdentifier: "SearchViewController")
        let tabTwoBarItem = createTabbarItemWith(title: "Tìm kiếm", image: "ic_tabbar_search", selectedImage: "ic_tabbar_search_selected")
        tabTwo.tabBarItem = tabTwoBarItem
        
        // tab lib
        let tabLib = storyboard.instantiateViewController(withIdentifier: "LibraryViewController")
        let tabLibItem = createTabbarItemWith(title: "Thư viện cá nhân", image: "ic_tabbar_lib", selectedImage: "ic_tabbar_lib_selected")
        tabLib.tabBarItem = tabLibItem
        
        // Create Tab four
        let tabVip = storyboard.instantiateViewController(withIdentifier: "VipViewController")
        let tabVipBarItem = createTabbarItemWith(title: "Vip", image: "ic_tabbar_vip", selectedImage: "ic_tabbar_vip_selected")
        tabVip.tabBarItem = tabVipBarItem
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.grayTextColor()], for: .normal)
        
        self.viewControllers = [tabOne, tabTwo, tabLib, tabVip]
        
    }
    
    func createTabbarItemWith(title: String, image: String, selectedImage: String) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: title, image: UIImage(named: image)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal))
        
        return tabBarItem
    }
}

extension TabBarController: UITabBarControllerDelegate {
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
       
    }
}

