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
        
        for _ in 0..<23 {
            let alarmView = AlarmView()
            stack?.addArrangedSubview(alarmView)
            alarmView.setupAlarmView(leftAnchor: stack!.leadingAnchor, rightAnchor: stack!.trailingAnchor)
            if let scroll = scroll {
                alarmView.pinWidth(to: scroll.widthAnchor)
            }
            let separatorView = SeparatorView()
            stack?.addArrangedSubview(separatorView)
            separatorView.setUpSeparatorView(leftAnchor: stack!.leadingAnchor, rightAnchor: stack!.trailingAnchor)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll?.contentSize = CGSize(
            width: scroll!.frame.width, height: self.stack!.frame.height)
    }
    
    
    private func setupStackView() {
        let stack = UIStackView(frame: .zero)
        scroll?.addSubview(stack)
        if let scroll = scroll {
            stack.pin(to: scroll)
        }
        stack.backgroundColor = .white
        stack.axis = .vertical
        scroll?.showsVerticalScrollIndicator = false
        scroll?.showsHorizontalScrollIndicator = false
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
