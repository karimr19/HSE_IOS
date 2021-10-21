//
//  StackViewController.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 06.10.2021.
//

import Foundation
import UIKit

final class StackViewController: UIViewController {
    private var stack: UIStackView?
    private var scroll: UIScrollView?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupScroll()
        setupStackView()
        
        var topAnchor = stack!.topAnchor;
        for _ in 0..<23 {
            let alarmView = AlarmView()
            stack?.addSubview(alarmView)
            alarmView.setupAlarmView(topAnchor: topAnchor, leftAnchor: stack!.leadingAnchor, rightAnchor: stack!.trailingAnchor)
            let separatorView = SeparatorView()
            stack?.addSubview(separatorView)
            separatorView.setUpSeparatorView(topAnchor: alarmView.bottomAnchor, leftAnchor: stack!.leadingAnchor, rightAnchor: stack!.trailingAnchor)
            topAnchor = alarmView.bottomAnchor
        }
//        stack?.addSubview(alarmView)
//        alarmView.setupAlarmView(topAnchor: stack!.topAnchor, leftAnchor: stack!.leadingAnchor, rightAnchor: stack!.trailingAnchor)
//        let separatorView = SeparatorView()
//        stack?.addSubview(separatorView)
//        separatorView.setUpSeparatorView(topAnchor: alarmView.bottomAnchor, leftAnchor: stack!.leadingAnchor, rightAnchor: stack!.trailingAnchor)
//        let newAlarmView = AlarmView()
//        stack?.addSubview(newAlarmView)
//        newAlarmView.setupAlarmView(topAnchor: separatorView.bottomAnchor, leftAnchor: stack!.leadingAnchor, rightAnchor: stack!.trailingAnchor)
//        let newSeparatorView = SeparatorView()
//        stack?.addSubview(newSeparatorView)
//        newSeparatorView.setUpSeparatorView(topAnchor: newAlarmView.bottomAnchor, leftAnchor: stack!.leadingAnchor, rightAnchor: stack!.trailingAnchor)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll?.contentSize = CGSize(
            width: scroll!.frame.width, height: self.stack!.frame.height)
    }
    
    
    private func setupStackView() {
        let stack = UIStackView(frame: .zero)
//        view.addSubview(stack)
        scroll?.addSubview(stack)
        stack.pinTop(to: scroll!.topAnchor)
        stack.pinBottom(to: scroll!.bottomAnchor)
//        stack.pinTop(to:view.safeAreaLayoutGuide.topAnchor)
//        stack.pinBottom(to:view.safeAreaLayoutGuide.bottomAnchor)
        stack.pinLeft(to:view)
        stack.pinRight(to:view)
//        stack.pin(to:view, .left, .right)
//        stack.widthAnchor.constraint(equalTo:scroll!.widthAnchor).isActive = true
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 0
        self.stack = stack
    }
    
    private func setupScroll() {
        let scroll = UIScrollView(frame: .zero)
        view.addSubview(scroll)
        scroll.pinTop(to:view.safeAreaLayoutGuide.topAnchor)
        scroll.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        scroll.pin(to:view, .left, .right)
        scroll.backgroundColor = .white
        scroll.alwaysBounceVertical = true
        self.scroll = scroll
    }
}
