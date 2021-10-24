//
//  StackViewController.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 06.10.2021.
//

import Foundation
import UIKit

final class StackViewController: UIViewController {
    private var stack = UIStackView()
    private var scroll = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupScroll()
        setupStackView()
        generateAlarms()
        
        let separatorView = SeparatorView()
        stack.addArrangedSubview(separatorView)
        separatorView.setUpSeparatorView(leftAnchor: stack.leadingAnchor, rightAnchor: stack.trailingAnchor)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll.contentSize = CGSize(
            width: scroll.frame.width, height: self.stack.frame.height)
    }
    
    
    private func setupStackView() {
        scroll.addSubview(stack)
        stack.pin(to: scroll)
        stack.backgroundColor = .white
        stack.axis = .vertical
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
    }
    
    private func setupScroll() {
        view.addSubview(scroll)
        scroll.pinTop(to:view.safeAreaLayoutGuide.topAnchor)
        scroll.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        scroll.pin(to:view, .left, .right)
        scroll.backgroundColor = .white
        scroll.alwaysBounceVertical = true
    }
    
    private func generateAlarms() {
        for _ in 0..<23 {
            let alarmView = AlarmView()
            stack.addArrangedSubview(alarmView)
            let minutes: Int = Int.random(in: 0...1440)
            alarmView.setupAlarmView(hours: minutes / 60, minutes: minutes % 60, isActive: Bool.random(), leftAnchor: stack.leadingAnchor, rightAnchor: stack.trailingAnchor)
            alarmView.pinWidth(to: scroll.widthAnchor)
            let separatorView = SeparatorView()
            stack.addArrangedSubview(separatorView)
            separatorView.setUpSeparatorView(leftAnchor: stack.leadingAnchor, rightAnchor: stack.trailingAnchor)
        }
    }
}
