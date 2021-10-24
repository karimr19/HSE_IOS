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
    private var alarms: [AlarmModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...200 {
            let minutes: Int = Int.random(in: 0...1440)
            alarms.append(
                AlarmModel(
                    hours: minutes / 60,
                    minutes: minutes % 60,
                    isActive: Bool.random()
                )
            )
        }
        alarms.sort(by: AlarmModel.sorterForAlarms)
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
        
        table.register(AlarmCell.self, forCellReuseIdentifier: "alarmCell")
        table.delegate = self
        table.dataSource = self
//        self.table = table
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alarms.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "alarmCell",
            for: indexPath
        ) as? AlarmCell
        cell?.setupAlarm(contentAlarm: alarms[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
