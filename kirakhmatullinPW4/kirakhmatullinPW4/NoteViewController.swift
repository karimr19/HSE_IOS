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
        self.navigationController?.popViewController(animated: true)
    }
}
