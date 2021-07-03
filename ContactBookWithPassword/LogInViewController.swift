//
//  ViewController.swift
//  ContactBookWithPassword
//
//  Created by Семен Соколов on 02.07.2021.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var helloStrangerLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    
    
    let username = "Admin"
    let password = "Admin"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        helloStrangerLabel.layer.masksToBounds = true
        helloStrangerLabel.layer.cornerRadius = 14
    }

    @IBAction func signInAction(_ sender: Any) {
        if usernameTextField.text == username, passwordTextField.text == password {
            guard let contactViewController = storyboard?.instantiateViewController(withIdentifier: "ContactBookViewController") as? ContactBookViewController  else {return}
            navigationController?.pushViewController(contactViewController, animated: true)
        } else {
            helloStrangerLabel.backgroundColor = .red
            helloStrangerLabel.text = "Stranger, your password or login is incorrect. Try to write correct data."
        }
        
    }
    
}

