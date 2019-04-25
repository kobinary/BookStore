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
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Properties
    
    private let viewModel = DetailViewModel()
    var bookViewModel: BookViewModel!

    // MARK: - Setups
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func setupView() {
        setupFields()
        setupTextView()
        self.scrollView.updateContentView()
    }
    
    private func setupTextView() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = true
        descriptionTextView.sizeToFit()
        descriptionTextView.isScrollEnabled = false
    }
    
    private func setupFields() {
        bookTitle.text = viewModel.book.title
        author.text = viewModel.book.author
        price.setTitle(viewModel.book.priceAndCurrency, for: .normal)
        descriptionTextView.text = viewModel.book.bookDescription
    }
    
    // MARK: - Fetch Data
    
    private func fetchData() {
        self.showSpinner(onView: self.view)
        viewModel.fetchBook(id: bookViewModel.id)
    }
        
    // MARK: - IBActions
    
    @IBAction func buyBook(_ sender: Any) {
        presentAlert(message:ALERT_MESSAGE_BUY.localized, title: ALERT_TITLE_BUY.localized)
    }

}

extension DetailViewController: DetailViewModelDelegate {
    
    func reloadBookData() {
        DispatchQueue.main.sync {
            self.removeSpinner()
            self.setupView()
        }
    }
    
    func showAlertView() {
        presentAlertWithTitle(title: ALERT_TITLE_NETWORK.localized, message: ALERT_MESSAGE_NETWORK.localized, options: OK_BUTTON.localized) { (result) in
            self.navigationController?.popViewController(animated: true)
        }
    }
}
