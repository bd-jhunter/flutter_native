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
    }
    
    @IBAction func tapFlutter(_ sender: UIButton) {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = JHViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.modalPresentationStyle = .overFullScreen
//        present(flutterViewController, animated: true, completion: nil)
        navigationController?.pushViewController(flutterViewController, animated: true)
        flutterViewController.pushRoute("firstPage")
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
}

