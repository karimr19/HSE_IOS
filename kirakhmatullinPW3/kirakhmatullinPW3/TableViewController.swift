//
//  TableViewController.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 06.10.2021.
//

import Foundation
import UIKit

final class TableViewController: UIViewController{
    private var table: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupTableView()
    }
    
    private func setupTableView() {
        let table = UITableView(frame: .zero)
        view.addSubview(table)
        table.pinTop(to:view.safeAreaLayoutGuide.topAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        table.pin(to:view, .left, .right)
        table.backgroundColor = .white
        self.table = table
    }
}
