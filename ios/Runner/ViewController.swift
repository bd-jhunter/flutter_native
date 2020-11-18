//
//  ViewController.swift
//  Runner
//
//  Created by hunter.liu on 2020/11/2.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    private var channel: FlutterMethodChannel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func tapLifecycle(_ sender: UIButton) {
        let vc = LifecycleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapFlutter(_ sender: UIButton) {
        showFlutter()
        return
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = JHViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.modalPresentationStyle = .overFullScreen
//        present(flutterViewController, animated: true, completion: nil)
        navigationController?.pushViewController(flutterViewController, animated: true)
        flutterViewController.pushRoute("firstPage")
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
 
    @IBAction func tapFlutterTab(_ sender: UIButton) {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = JHViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        navigationController?.pushViewController(flutterViewController, animated: true)
        flutterViewController.pushRoute("tabBarPage")
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Private methods
    private func setup() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let channel = FlutterMethodChannel(name: "com.jh.rootchannel", binaryMessenger: flutterEngine.binaryMessenger)
        self.channel = channel
        channel .setMethodCallHandler { (call, result) in
            switch call.method {
            case "close":
                self.navigationController?.popViewController(animated: true)
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            case "openfirst":
                let vc = FirstViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            case "opensecond":
                let vc = SecondViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            default:
                break
            }
        }
    }
    
    private func showFlutter() {
        let vc = FlutterViewController(project: nil, nibName: nil, bundle: nil)
        let channel = FlutterMethodChannel(name: "com.jh.rootchannel", binaryMessenger: vc.binaryMessenger)
        self.channel = channel
        channel .setMethodCallHandler { (call, result) in
            switch call.method {
            case "close":
                self.navigationController?.popViewController(animated: true)
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            case "openfirst", "opensecond":
                self.showFlutter()
            default:
                break
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        vc.pushRoute("firstPage")
    }
}

