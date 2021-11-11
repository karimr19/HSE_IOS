//
//  ViewController.swift
//  kirakhmatullinPW5
//
//  Created by Karim on 11.11.2021.
//

import UIKit

class ArticleViewController: UIViewController {
    private var table: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        let table = UITableView(frame: .zero)
        view.addSubview(table)
        table.pinTop(to:view.safeAreaLayoutGuide.topAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        table.pin(to:view, .left, .right)
        table.backgroundColor = .white
        
//        table.register(AlarmCell.self, forCellReuseIdentifier: "alarmCell")
        table.delegate = self
        table.dataSource = self
        self.table = table
    }


}

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

