//
//  MasterViewController.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

private let numberOfItemsInSection = 2
private let itemsPerRow: CGFloat = 2

class MasterViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let viewModel = MasterViewModel()
    private var loadingView : UIView!
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)

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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MASTER_VIEW_CELL_IDENTIFIER, for: indexPath) as! MasterViewCell
        print(indexPath.row, indexPath.section)
        let cellViewModel = viewModel.books[indexPath.item]
        cell.update(viewModel: cellViewModel)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigateToDetails(viewModel: viewModel.books[indexPath.row])
    }
    
    // MARK: - Navigation

    func navigateToDetails(viewModel: BookViewModel) {
        self.collectionView.backgroundView = nil
        let detailsNav = storyboard!.instantiateViewController(withIdentifier: NAV_DETAIL_IDENTIFIER) as! UINavigationController
        let detailsVC = detailsNav.topViewController as! DetailViewController
        detailsVC.bookViewModel = viewModel
        self.navigationController!.pushViewController(detailsVC, animated: true)
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
}

// MARK: - Collection View Flow Layout Delegate

extension MasterViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
