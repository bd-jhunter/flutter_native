//
//  ContractsViewController.swift
//  Runner
//
//  Created by hunter.liu on 2020/11/19.
//

import UIKit

class ContractsViewController: JHViewController, ITabBarTopPage {
    let tabBarTitle: String = "联系人"
    let tabBarImage: UIImage = #imageLiteral(resourceName: "MenuBarContactSelected")

    private let pageIndex = 1;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
