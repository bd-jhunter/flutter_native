//
//  JHViewController.swift
//  Runner
//
//  Created by jhunter on 2020/11/15.
//

import UIKit
import Flutter

class JHViewController: FlutterViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        attachEngine()
        if !(navigationController?.isNavigationBarHidden ?? true) {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        attachEngine()
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dettachEngine()
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        dettachEngine()
        super.viewDidDisappear(animated)
    }
    
    private func attachEngine() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        if flutterEngine.viewController != self {
            flutterEngine.viewController = self
        }
    }
    
    private func dettachEngine() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        if flutterEngine.viewController == self {
            flutterEngine.viewController = nil
        }
    }
}
