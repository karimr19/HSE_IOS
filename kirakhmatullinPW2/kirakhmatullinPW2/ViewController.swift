//
//  ViewController.swift
//  kirakhmatullinPW2
//
//  Created by Karim on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        setupSettingsButton()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
    }
    
    private func setupSettingsButton() {
        let settingsButton = UIButton(type: .system)
        view.addSubview(settingsButton)
        settingsButton.setImage(
        UIImage(named: "settings")?.withRenderingMode(.alwaysOriginal),
        for: .normal
        )
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.topAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.topAnchor,
        constant: 15
        ).isActive = true
        settingsButton.trailingAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.trailingAnchor,
        constant: -15 ).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 30).isActive
        = true
        settingsButton.widthAnchor.constraint(equalTo:
        settingsButton.heightAnchor).isActive = true
        
    }


}

