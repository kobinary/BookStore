//
//  DetailViewModel.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

protocol DetailViewModelDelegate: class {
    func reloadBookData()
    func showAlertView()
}

class DetailViewModel: NSObject {

    // MARK: - Properties

    let manager: NetworkManagerProtocol = NetworkManager()
    weak var delegate: DetailViewModelDelegate?
    var book: BookViewModel!

    // MARK: - Fetcher
    
    func fetchBook(id: Int) {
        manager.fetchBook(id: id) { [weak self] (results) in
            guard let self = self else { return }
            
            switch results {
            case .error(let error) :
                self.delegate?.showAlertView()
            case .results(let data):
                self.book = BookViewModel.init(book: data)
                self.delegate?.reloadBookData()
            }
        }
    }
}
