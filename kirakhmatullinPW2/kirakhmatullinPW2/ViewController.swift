//
//  ViewController.swift
//  kirakhmatullinPW2
//
//  Created by Karim on 21.09.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    private let settingsView = UIStackView()
    private let locationTextView = UITextView()
    private let locationManager = CLLocationManager()
    private let locationToggle = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        locationManager.requestWhenInUseAuthorization()
        setupLocationTextView()
        setupSettingsView()
        setupSettingsButton()
        setupLocationToggle()
        setupSliders()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupSettingsView(){
        view.addSubview(settingsView)
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        settingsView.layer.cornerRadius = 15
        settingsView.backgroundColor = .lightGray
        settingsView.alpha = 0
        settingsView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        settingsView.widthAnchor.constraint(
            equalTo: settingsView.heightAnchor,
            multiplier: 2 / 3
        ).isActive = true
        settingsView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 10
        ).isActive = true
        settingsView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -10
        ).isActive = true
        settingsView.axis = .vertical
    }
    
    private func setupSettingsButton() {
        let settingsButton = UIButton(type: .system)
        view.addSubview(settingsButton)
        settingsButton.setImage(
            UIImage(named: "settings")?.withRenderingMode(.alwaysOriginal),
            for: .normal)
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
    
    private func setupLocationTextView() {
         view.addSubview(locationTextView)
         locationTextView.backgroundColor = .white
        locationTextView.layer.cornerRadius = 20
        locationTextView.translatesAutoresizingMaskIntoConstraints = false
        locationTextView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 60
        ).isActive = true
        locationTextView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        ).isActive = true
        locationTextView.heightAnchor.constraint(equalToConstant: 300
        ).isActive = true
        locationTextView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: 15
        ).isActive = true
        locationTextView.isUserInteractionEnabled = false
    }
    private func setupLocationToggle(){
        let locationLabel = UILabel()
        settingsView.addArrangedSubview(locationLabel)
        locationLabel.text = "Location"
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsView.addArrangedSubview(locationToggle)
        locationToggle.translatesAutoresizingMaskIntoConstraints = false
        locationToggle.addTarget(
            self,
            action: #selector(locationToggleSwitched),
            for: .valueChanged
        )
    }
    private var buttonCount = 0
    @objc private func settingsButtonPressed() {
        switch buttonCount {
        case 0, 1:
            UIView.animate(withDuration: 0.1, animations: {
                self.settingsView.alpha = 1 - self.settingsView.alpha
            })
        case 2:
            let settingsViewController = createSettingsViewController()
//            settingsViewController.isToggleOn = locationToggle.isOn
//            settingsViewController.locationManager = locationManager
//            settingsViewController.delegate = self
//            settingsViewController.red = CGFloat(sliders[0].value)
//            settingsViewController.green = CGFloat(sliders[1].value)
//            settingsViewController.blue = CGFloat(sliders[2].value)
            
            navigationController?.pushViewController(
                settingsViewController,
                animated: true
            )
        case 3:
            let settingsViewController = createSettingsViewController()
//            settingsViewController.isToggleOn = locationToggle.isOn
//            settingsViewController.locationManager = locationManager
//            settingsViewController.delegate = self
//            settingsViewController.red = CGFloat(sliders[0].value)
//            settingsViewController.green = CGFloat(sliders[1].value)
//            settingsViewController.blue = CGFloat(sliders[2].value)
            
            navigationController?.pushViewController(
                settingsViewController,
                animated: true
            )
        default:
            buttonCount = -1
        }
        buttonCount += 1
    }
    func createSettingsViewController()->SettingsViewController{
        let settingsViewController = SettingsViewController()
        settingsViewController.isToggleOn = locationToggle.isOn
        settingsViewController.locationManager = locationManager
        settingsViewController.delegate = self
        settingsViewController.red = CGFloat(sliders[0].value)
        settingsViewController.green = CGFloat(sliders[1].value)
        settingsViewController.blue = CGFloat(sliders[2].value)
        return settingsViewController
    }
    @objc
    func locationToggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy =
    kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
            } else {
                sender.setOn(false, animated: true)
            }
    } else {
        locationTextView.text = ""
        locationManager.stopUpdatingLocation()
        }
    }
    private let sliders = [CustomSlider(), CustomSlider(), CustomSlider()]
        private let colors = ["Red", "Green", "Blue"]
    private func setupSliders() {
        var top = 80
        for i in 0..<sliders.count {
            let view = UIView()
            settingsView.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            
            view.topAnchor.constraint(
                equalTo: settingsView.topAnchor,
                constant: CGFloat(top)
            ).isActive = true
            top += 40
            let label = UILabel()
            view.addSubview(label)
            label.text = colors[i]
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 5
            ).isActive = true
            label.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ).isActive = true
            label.widthAnchor.constraint(
                equalToConstant: 50
            ).isActive = true
            let slider = sliders[i]
            slider.setSlider()
            slider.maximumValue = 1
            slider.addTarget(self, action: #selector(sliderChangedValue), for: .valueChanged)
            view.addSubview(slider)
            slider.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
            slider.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            slider.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10).isActive = true
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
        }
    }
    @objc private func sliderChangedValue() {
        let red: CGFloat = CGFloat(sliders[0].value)
        let green: CGFloat = CGFloat(sliders[1].value)
        let blue: CGFloat = CGFloat(sliders[2].value)
        view.backgroundColor = UIColor(red: red, green: green, blue:
    blue, alpha: 1)
    }
    
    


}
protocol ViewControllerDelegate:AnyObject {
    func updateLocation(isTurnedOn:Bool)
    func updateColors(red:CGFloat, green:CGFloat, blue:CGFloat)
}
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
didUpdateLocations locations: [CLLocation]) {
        guard let coord: CLLocationCoordinate2D =
manager.location?.coordinate else { return }
        locationTextView.text = "Coordinates = \(coord.latitude) \(coord.longitude)"
    }
}
extension ViewController:ViewControllerDelegate{
    func updateColors(red: CGFloat, green: CGFloat, blue: CGFloat) {
        sliders[0].value = Float(red)
        sliders[1].value = Float(green)
        sliders[2].value = Float(blue)
        sliderChangedValue()
    }
    
    func updateLocation(isTurnedOn: Bool) {
        locationToggle.isOn = isTurnedOn
        locationToggleSwitched(locationToggle)
    }
}


