//
//  MainStarter.swift
//  Runner
//
//  Created by hunter.liu on 2020/11/19.
//

import UIKit
import Flutter

protocol ITabBarTopPage {
    var tabBarTitle: String { get }
    var tabBarImage: UIImage { get }
}

class MainStarter: NSObject {
    static let shared = MainStarter()
    
    private(set) var window: UIWindow!
    private var tabBarController: UITabBarController!
    var flutterEngine: FlutterEngine {
        return (UIApplication.shared.delegate as! AppDelegate).flutterEngine
    }
    private var channel: FlutterMethodChannel?

    private lazy var homePageViewController: UINavigationController = {
        let vc = HomePageViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }()
    
    private lazy var contractsPageViewController: UINavigationController = {
        let vc = ContractsViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }()
    
    private lazy var settingPageViewController: UINavigationController = {
        let vc = SettingViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }()
    
    private var currentNavigationController: UINavigationController? {
        return (tabBarController.selectedViewController as? UINavigationController)
    }
    
    override init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        super.init()
    }
    
    // MARK: - Public methods
    func start() {
        setup()
    }
    
    // MARK: - Private methods
    private func setup() {
        prepareMethodChannel()
        let tabBarController: UITabBarController = {
            window.rootViewController = $0
            $0.tabBar.barTintColor = .white
            $0.tabBar.isTranslucent = false
            $0.delegate = self
            let viewControllers = [homePageViewController, contractsPageViewController, settingPageViewController]
            let corePages: [ITabBarTopPage] = viewControllers.map({ $0.viewControllers.first as! ITabBarTopPage })
            $0.viewControllers = viewControllers
            if let items = $0.tabBar.items {
                for (tabBarItem, menuItem) in zip(items, corePages) {
                    tabBarItem.image = menuItem.tabBarImage
                    tabBarItem.title = menuItem.tabBarTitle
                }
            }
            return $0
        }(UITabBarController(nibName: nil, bundle: nil))
        self.tabBarController = tabBarController
        
        window.makeKeyAndVisible()
        switchToTab(index: 0)
    }
    
    private func prepareMethodChannel() {
        let channel = FlutterMethodChannel(name: "com.jh.flutter/hybridstack", binaryMessenger: flutterEngine.binaryMessenger)
        self.channel = channel
        channel .setMethodCallHandler { (call, result) in
            switch call.method {
            case "close":
                self.currentNavigationController?.popViewController(animated: true)
                self.currentNavigationController?.setNavigationBarHidden(false, animated: true)
            case "openfirst":
                let vc = FirstViewController()
                self.currentNavigationController?.pushViewController(vc, animated: true)
                self.currentNavigationController?.setNavigationBarHidden(false, animated: true)
            case "opensecond":
                let vc = SecondViewController()
                self.currentNavigationController?.pushViewController(vc, animated: true)
                self.currentNavigationController?.setNavigationBarHidden(false, animated: true)
            default:
                break
            }
        }
    }
}

extension MainStarter: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let indexOfController = tabBarController.viewControllers?.firstIndex(of: viewController), indexOfController != tabBarController.selectedIndex {
            switchToTab(index: indexOfController)
            return true
        } else {
            return false
        }
    }
    
    
    private func switchToTab(index: Int) {
        channel?.invokeMethod("openTab", arguments: index)
        currentNavigationController?.popToRootViewController(animated: true)
    }
}
