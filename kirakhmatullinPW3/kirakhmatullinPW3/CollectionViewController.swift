//
//  CollectionViewController.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 06.10.2021.
//

import Foundation
import UIKit

final class CollectionViewController: UIViewController {
    private var collection: UICollectionView?
    private var alarms: [AlarmModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        generateAlarms()
        view.backgroundColor = .blue
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout();
        layoutFlow.sectionInset = UIEdgeInsets(top: 20, left: 10,
                                               bottom:10, right: 10)
        layoutFlow.itemSize = CGSize(width: view.frame.width - 20, height: 55)
        layoutFlow.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.pinTop(to:view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to:view, .left, .right)
        collection.backgroundColor = .white
        
        collection.register(VerticalAlarmCell.self, forCellWithReuseIdentifier: "verticalAlarmCell")
        collection.delegate = self
        collection.dataSource = self
        self.collection = collection
    }
    
    private func generateAlarms() {
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
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return alarms.count
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "verticalAlarmCell",
            for: indexPath
        ) as? VerticalAlarmCell
        cell?.setupVerticalAlarm(contentAlarm: alarms[indexPath.row])
        return cell ?? UICollectionViewCell()
    }

}
