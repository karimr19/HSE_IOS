//
//  NoteViewController.swift
//  kirakhmatullinPW4
//
//  Created by Karim on 27.10.2021.
//

import UIKit

class NoteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    var outputVC: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:  #selector(didTapSaveNote(button:)))
    }
    @objc func didTapSaveNote(button: UIBarButtonItem) {
        let title = titleTextField.text ?? ""
        let descriptionText = textView.text ?? ""
        if !title.isEmpty {
            let newNote = Note(context: outputVC.context)
            newNote.title = title
            newNote.descriptionText = descriptionText
            newNote.creationDate = Date()
            newNote.status = Int32(Int.random(in: 0..<4))
            outputVC.saveChanges()
            outputVC.loadData()
        }
        self.navigationController?.popViewController(animated: true)
    }
}
