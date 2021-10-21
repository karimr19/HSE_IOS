//
//  ViewController.swift
//  kirakhmatullinPW4
//
//  Created by Karim on 21.10.2021.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var emptyCollectionLabel: UILabel!
    @IBOutlet weak var notesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNote(sender:)))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        collectionView.dequeueReusableCell(withReuseIdentifier:
        "NoteCell", for: indexPath) as! NoteCell
        cell.titleLabel.text = "Yeah"
        cell.descriptionLabel.text = "That's greate"
        return cell
    }
    
//    @objc func createNote(sender: UIBarButtonItem) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier:
//            "NoteVewController") else {
//                return
//        }
//        navigationController?.pushViewController(vc, animated: true)
//    }
}


