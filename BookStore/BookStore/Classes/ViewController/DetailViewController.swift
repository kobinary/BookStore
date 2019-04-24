//
//  DetailViewController.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var price: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Properties
    
    var viewModel : BookViewModel!

    // MARK: - Setups
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        bookTitle.text = viewModel.title
        author.text = viewModel.author
        price.setTitle(viewModel.priceAndCurrency, for: .normal)
        descriptionTextView.text = viewModel.bookDescription
    }
    
    // MARK: - IBActions
    
    @IBAction func buyBook(_ sender: Any) {
        
    }

}
