//
//  ViewController.swift
//  kirakhmatullinPW4
//
//  Created by Karim on 27.10.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var emtpyCollectionLabel: UILabel!
    @IBOutlet weak var notesCollectionView: UICollectionView!
    
    let context: NSManagedObjectContext = {
        let container = NSPersistentContainer(name: "CoreDataNotes")
        container.loadPersistentStores{_, error in
            if let error = error {
                fatalError("Container loading failed")
            }
        }
        return container.viewContext
    }()
    
    var notes: [Note] = [] {
        didSet {
            emtpyCollectionLabel.isHidden = notes.count != 0
            notesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNote(sender:)))
    }
    
    func saveChanges() {
        if context.hasChanges {
            try? context.save()
        }
        if let notes = try? context.fetch(Note.fetchRequest()) as [Note]{
            // Sets relationships.
            if (notes.count > 1) {
                notes[notes.count - 1].relateToLastNote = notes[notes.count - 2]
            }
            
            self.notes = notes
        } else {
            self.notes = []
        }
    }
    
    func loadData() {
        if let notes = try? context.fetch(Note.fetchRequest()) as [Note]{
            self.notes = notes.sorted(by: {$0.creationDate.compare($1.creationDate) == .orderedDescending})
        } else {
            self.notes = []
        }
    }
    @objc func createNote(sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NoteViewController") as? NoteViewController else {
            return
        }
        vc.outputVC = self
        navigationController?.pushViewController(vc, animated: true)
    }
}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCell", for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.titleLabel.text = note.title
        cell.descriptionLabel.text = note.descriptionText
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let identifier = "\(indexPath.row)" as NSString
        return UIContextMenuConfiguration(identifier: identifier, previewProvider: .none) {_ in
            let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: UIMenuElement.Attributes.destructive) {value in
                self.context.delete(self.notes[indexPath.row])
                self.saveChanges()
            }
            return UIMenu(title: "", image: nil,children: [deleteAction])
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 20, height: 100)
    }
}
