//
//  MasterViewController.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "BookViewCell"
private let NavigationIdentifier = "DetailNavigation"
private let numberOfColums = 2

class MasterViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let viewModel = MasterViewModel()
    
    // MARK: - Setups
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func setupView() {
        setupNavigationItems()
    }
    
    private func setupNavigationItems() {
        navigationItem.titleView = LogoHelper().setupLogo()
    }
    
    // MARK: - Fetch Data
    
    private func fetchData() {
        viewModel.fetchListBooks()
    }
    
    // MARK: - UICollectionView DataSource & Delegate
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfColums
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bookID = viewModel.books[indexPath.row].id
        viewModel.fetchBook(id: bookID!)
    }
}

