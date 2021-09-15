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
        // Draws rectangles when user opens the app.
        for view in views {
            view.layer.cornerRadius = 10
            view.backgroundColor = UIColor(hex: generateRandomHexString())
        }
        
        // Do any additional setup after loading the view.
    }
    // Changes colors of rectangles when button is pressed.
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        // Reads pressed button.
        let button = sender as? UIButton
        button?.isEnabled = false
        // Fills rectangles with randomly generated colors and disables the button untill animation is done.
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

