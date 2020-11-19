//
//  HomePageViewController.swift
//  Runner
//
//  Created by hunter.liu on 2020/11/19.
//

import UIKit
import Flutter

class HomePageViewController: JHViewController, ITabBarTopPage {
    let tabBarTitle: String = "主页"
    let tabBarImage: UIImage = #imageLiteral(resourceName: "MenuBarHomeSelected")

    private let pageIndex = 0;

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
