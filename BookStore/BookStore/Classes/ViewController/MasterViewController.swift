//
//  MasterViewController.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

private let numberOfItemsInSection = 2

class MasterViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let viewModel = MasterViewModel()
    private var loadingView : UIView!

    // MARK: - Setups
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func setupView() {
        setupNavigationItems()
        setupLoading()
    }
    
    private func setupNavigationItems() {
        navigationItem.titleView = LogoHelper().setupLogo()
    }
    
    private func setupLoading() {
        loadingView = (Bundle.main.loadNibNamed(LOADING_VIEW_NAME, owner: nil, options: nil)![0] as! UIView)
        collectionView.backgroundView = loadingView
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
        return numberOfItemsInSection
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MASTER_VIEW_CELL_IDENTIFIER, for: indexPath) as! MasterViewCell
        let cellViewModel = viewModel.books[indexPath.row]
        cell.update(viewModel: cellViewModel)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bookID = viewModel.books[indexPath.row].id
        viewModel.fetchBook(id: bookID!)
    }
}

// MARK: - MasterViewModel delegate

extension MasterViewController: MasterViewModelDelegate {
    
    func reloadBooksCollection() {
        DispatchQueue.main.sync {
            self.collectionView.backgroundView = nil
            self.collectionView.reloadData()
        }
    }
    
    func navigateToDetails(viewModel: BookViewModel) {
        DispatchQueue.main.sync {
            self.collectionView.backgroundView = nil

            let detailsNav = storyboard!.instantiateViewController(withIdentifier: NAV_DETAIL_IDENTIFIER) as! UINavigationController
            let detailsVC = detailsNav.topViewController as! DetailViewController
            detailsVC.viewModel = viewModel
            self.navigationController!.pushViewController(detailsVC, animated: true)
        }
    }
}


