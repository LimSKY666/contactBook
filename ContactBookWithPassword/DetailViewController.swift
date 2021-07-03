//
//  DetailViewController.swift
//  ContactBookWithPassword
//
//  Created by Семен Соколов on 03.07.2021.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func saveNewComment (_ contact: Contact)
}

class DetailViewController: UIViewController {
    

    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    
    var contact: Contact?
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneLabel.layer.masksToBounds = true
        phoneLabel.layer.cornerRadius = 15
        jobLabel.layer.masksToBounds = true
        jobLabel.layer.cornerRadius = 15
        commentTextView.layer.masksToBounds = true
        commentTextView.layer.cornerRadius = 15
        nameLabel.text = contact?.name
        surnameLabel.text = contact?.surname
        phoneLabel.text = contact?.phoneNumber
        jobLabel.text = contact?.job
        commentTextView.text = contact?.comment
        
        
    }
    @IBAction func saveButtonAction(_ sender: Any) {
        contact?.comment = commentTextView.text
        if let contact = contact {
            delegate?.saveNewComment(contact)
        }
        dismiss(animated: true)
    }
}
