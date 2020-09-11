//
//  Extension + LoginVC.swift
//  KHL
//
//  Created by Kairzhan Kural on 9/11/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

extension LoginViewController {
    
    func wrongUsernameAlert() {
        let alert = UIAlertController(
            title: "Неправильный логин",
            message: "Пожалуйста, вводите правильный логин",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        username.text = nil
        password.text = nil
    }
    
    func wrongPasswordAlert() {
        let alert = UIAlertController(
            title: "Неправильный пароль",
            message: "Пожалуйста, вводите правильный пароль",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        password.text = nil
    }
}
