//
//  ViewController.swift
//  kirakhmatullinPW1
//
//  Created by Karim on 12.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var views:[UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()

        for view in views {
            view.layer.cornerRadius = 10
            view.backgroundColor = UIColor(hex: generateRandomHexString())
        }
        
        // Do any additional setup after loading the view.
    }
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false
        UIView.animate(withDuration: 2, animations: {
            for view in self.views {
                view.layer.cornerRadius = 10
                view.backgroundColor = UIColor(hex: generateRandomHexString())
            }
        }) { completion in
            button?.isEnabled = true
        }
    }
    
}

