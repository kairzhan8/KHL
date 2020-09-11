//
//  LoginViewController.swift
//  KHL
//
//  Created by Kairzhan Kural on 9/1/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login() {
        
        guard let userName = username.text, !(userName.isEmpty) else {
            wrongUsernameAlert()
            return
        }
        guard let passWord = password.text, !(passWord.isEmpty) else {
            wrongPasswordAlert()
            return
        }
        let user = UserDefaults.standard.value(forKey: "username") as? String
        let pass = UserDefaults.standard.value(forKey: "password") as? String
        
        if user == nil && pass == nil {
            UserDefaults.standard.set(username.text, forKey: "username")
            UserDefaults.standard.set(password.text, forKey: "password")
            
        }
        
        if user == username.text && pass == password.text {
             let storyboard = UIStoryboard(name: "Login", bundle: nil)
                   let secondVC = storyboard.instantiateViewController(identifier: "nav")

                   show(secondVC, sender: self)
        } else if user != username.text {
            wrongUsernameAlert()
            return
        } else if pass != password.text {
            wrongPasswordAlert()
            return
        }
        username.text = nil
        password.text = nil
    }
    
    @IBAction func forgotUsername() {
        guard let username = UserDefaults.standard.value(forKey: "username") as? String else { return }
        let alert = UIAlertController(title: "Привет", message: "Ваш логин - \(username)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func forgotPassword() {
        guard let password = UserDefaults.standard.value(forKey: "password") as? String else { return }
        let alert = UIAlertController(title: "Привет", message: "Ваш пароль - \(password)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}
