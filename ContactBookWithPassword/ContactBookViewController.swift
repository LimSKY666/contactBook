//
//  ContactBookViewController.swift
//  ContactBookWithPassword
//
//  Created by Семен Соколов on 02.07.2021.
//

import UIKit

class ContactBookViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Contact] =  [Contact(name: "Данил", surname: "Маров", job: "Зубной",                          phoneNumber: "+3453453", comment: "Friend"),
                           Contact (name: "Иван", surname: "Свинушкин", job: "Тренер", phoneNumber: "+723123", comment: "Позвонить, чтобы спросить как дела"),
                           Contact(name: "Алина", surname: "Миннибаева", job: "Старший разработчик", phoneNumber: "+7942342", comment: "попросить помочь c вещами")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension ContactBookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let contactBookViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return}
        contactBookViewController.delegate = self
        contactBookViewController.contact = data[indexPath.row]
        
        present(contactBookViewController, animated: true)
    }
}

extension ContactBookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell (withIdentifier: "ContactBookTableViewCell", for: indexPath) as? ContactBookTableViewCell else {return UITableViewCell()}
        cell.setData(person: data[indexPath.row])
        return cell
    }
}

extension ContactBookViewController: DetailViewControllerDelegate {
    func saveNewComment(_ contact: Contact) {
        if let index = data.firstIndex(where: {
                                        $0.name == contact.name && $0.surname == contact.surname }) {
            data[index] = contact
        }
    }
}

struct Contact {
    let name: String
    let surname: String
    let job: String
    let phoneNumber: String
    var comment: String
}
