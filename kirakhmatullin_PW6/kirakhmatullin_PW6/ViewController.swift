//
//  ViewController.swift
//  kirakhmatullin_PW6
//
//  Created by Karim on 19.11.2021.
//

import UIKit

class ViewController: UIViewController {
    var buttonFramework = UIButton()
    var buttonSwiftPackage = UIButton()
    var buttonPod = UIButton()
    var buttonCarthage = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupFrameworkButton()
        setupSwiftPackageButton()
        setupPodButton()
        setupCarthageButton()
    }
    
    func setupFrameworkButton() {
        buttonFramework.addTarget(self, action: #selector(self.frameworkButtonClicked), for: .touchUpInside)
        self.view.addSubview(buttonFramework)
        buttonFramework.setTitle("log (framework)", for: .normal)
        buttonFramework.setTitleColor(.blue, for: .normal)
        buttonFramework.translatesAutoresizingMaskIntoConstraints = false
        buttonFramework.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40
        ).isActive = true
        buttonFramework.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor
        ).isActive = true
    }
    
    func setupSwiftPackageButton() {
        buttonSwiftPackage.addTarget(self, action: #selector(swiftPackageButtonClicked), for: .touchUpInside)
        self.view.addSubview(buttonSwiftPackage)
        buttonSwiftPackage.setTitle("log (package)", for: .normal)
        buttonSwiftPackage.setTitleColor(.blue, for: .normal)
        buttonSwiftPackage.translatesAutoresizingMaskIntoConstraints = false
        buttonSwiftPackage.topAnchor.constraint(equalTo: buttonFramework.bottomAnchor, constant: 15
        ).isActive = true
        buttonSwiftPackage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor
        ).isActive = true
    }
    
    func setupPodButton() {
        buttonPod.addTarget(self, action: #selector(podButtonClicked), for: .touchUpInside)
        self.view.addSubview(buttonPod)
        buttonPod.setTitle("log (pod)", for: .normal)
        buttonPod.setTitleColor(.blue, for: .normal)
        buttonPod.translatesAutoresizingMaskIntoConstraints = false
        buttonPod.topAnchor.constraint(equalTo: buttonSwiftPackage.bottomAnchor, constant: 15
        ).isActive = true
        buttonPod.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor
        ).isActive = true
    }
    
    func setupCarthageButton() {
        buttonCarthage.addTarget(self, action: #selector(carthageButtonClicked), for: .touchUpInside)
        self.view.addSubview(buttonCarthage)
        buttonCarthage.setTitle("log (package)", for: .normal)
        buttonCarthage.setTitleColor(.blue, for: .normal)
        buttonCarthage.translatesAutoresizingMaskIntoConstraints = false
        buttonCarthage.topAnchor.constraint(equalTo: buttonPod.bottomAnchor, constant: 15
        ).isActive = true
        buttonCarthage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor
        ).isActive = true
    }
    @objc func frameworkButtonClicked() {

    }

    @objc func swiftPackageButtonClicked() {

    }

    @objc func carthageButtonClicked() {
        
    }

    @objc func podButtonClicked() {
    }
}

