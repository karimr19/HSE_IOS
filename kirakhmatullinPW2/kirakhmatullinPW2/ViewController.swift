//
//  ViewController.swift
//  kirakhmatullinPW2
//
//  Created by Karim on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {
    private let settingsView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        setupSettingsButton()
        setupSettingsView()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
    }
    private func setupSettingsView(){
        view.addSubview(settingsView)
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        settingsView.backgroundColor = .red
        settingsView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        settingsView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        settingsView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 55
        ).isActive = true
        settingsView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -10
        ).isActive = true
        settingsView.alpha = 0
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
            constant: -15
        ).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 30
        ).isActive = true
        settingsButton.widthAnchor.constraint(equalTo: settingsButton.heightAnchor).isActive = true
        settingsButton.addTarget(self, action: #selector(settingsButtonPressed),
        for: .touchUpInside)
        
    }
    @objc
    private func settingsButtonPressed() {
        UIView.animate(withDuration: 0.1, animations: {
            self.settingsView.alpha = 1 - self.settingsView.alpha
    })
    }
    


}

