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
    
    private func attachEngine() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        if flutterEngine.viewController != self {
            flutterEngine.viewController = self
        }
    }
}
