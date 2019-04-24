//
//  MasterViewCell.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class MasterViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var price: UILabel!
    
    // MARK: - Setups
    
    func update(viewModel: BookViewModel) {
        self.title.text = viewModel.title
        self.author.text = viewModel.author
        self.price.text = viewModel.priceAndCurrency
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
