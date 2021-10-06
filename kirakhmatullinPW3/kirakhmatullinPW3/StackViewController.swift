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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupStackView()
    }
    
    private func setupStackView() {
        let stack = UIStackView(frame: .zero)
        view.addSubview(stack)
        stack.pinTop(to:view.safeAreaLayoutGuide.topAnchor)
        stack.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        stack.pin(to:view, .left, .right)
        stack.backgroundColor = .white
        self.stack = stack
    }
}
