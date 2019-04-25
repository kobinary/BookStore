//
//  UIViewController+Alert.swift
//  BookStore
//
//  Created by Maria Ortega on 25/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Alert with custom actions

    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Alert with custom OK action

    func presentAlert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: OK_BUTTON.localized, style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
