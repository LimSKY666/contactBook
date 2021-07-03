//
//  ContactBookTableViewCell.swift
//  ContactBookWithPassword
//
//  Created by Семен Соколов on 02.07.2021.
//

import UIKit

class ContactBookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData (person: Contact) {
        fullName.text = "\(person.name) \(person.surname)"
        phone.text = person.phoneNumber
    }

}
