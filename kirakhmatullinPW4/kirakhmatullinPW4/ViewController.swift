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
    
    var notes: [Note] = [] {
        didSet{
            emptyCollectionLabel.isHidden = notes.count != 0
            notesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNote(sender:)))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        collectionView.dequeueReusableCell(withReuseIdentifier:
        "NoteCell", for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.titleLabel.text = note.title
        cell.descriptionLabel.text = note.description
        cell.contentView.widthAnchor.constraint(equalToConstant: collectionView.bounds.size.width - collectionView.contentInset.left - collectionView.contentInset.right).isActive = true
        return cell
    }
    
    @objc func createNote(sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier:
            "NoteViewController") as? NoteViewController else {
                return
        }
        vc.outputVC = self
        navigationController?.pushViewController(vc, animated: true)
    }
}


