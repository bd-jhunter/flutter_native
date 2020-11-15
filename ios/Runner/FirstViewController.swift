//
//  FirstViewController.swift
//  Runner
//
//  Created by jhunter on 2020/11/15.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(_ sender: UIButton) {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = JHViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.modalPresentationStyle = .overFullScreen
        navigationController?.pushViewController(flutterViewController, animated: true)
        flutterViewController.pushRoute("secondPage")
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
