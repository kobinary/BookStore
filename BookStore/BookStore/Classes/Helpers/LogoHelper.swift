//
//  LogoHelper.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class LogoHelper: NSObject {

    // MARK: - Properties
    
    private let icon = "logoIcon.png"
    
    // MARK: - Setup Logo
    
    func setupLogo() -> UIImageView {
        let logo = UIImage(named: icon)
        let imageView = UIImageView(image:logo)
        return imageView
    }
}
