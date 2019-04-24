//
//  MasterViewModel.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit
import Foundation

protocol MasterViewModelDelegate: class {    
    func reloadBooksCollection()
}

class MasterViewModel {
    
    // MARK: - Properties
    
    private let manager: NetworkManagerProtocol
    weak var delegate: MasterViewModelDelegate?
    var books = [BookViewModel]()
    
    // MARK: - Init
    
    init(manager: NetworkManagerProtocol = NetworkManager()) {
        self.manager = manager
    }
    
    // MARK: - Fetcher
    
    func fetchListBooks() {
        manager.fetchListBooks() { [weak self] (results) in
            guard let self = self else { return }
            
            switch results {
            case .error(let error) :
                print("Error Fetching Data: \(error)")
                break
            case .results(let data):
                self.books = self.parseListBooksIntoViewModel(array: data)
                self.delegate?.reloadBooksCollection()
            }
        }
    }
    
    // MARK: - Parser Model into ViewModel
    
    private func parseListBooksIntoViewModel(array: Array<Book>) -> [BookViewModel] {
        var booksVM : [BookViewModel] = []
        
        for book in array {
            let bookVM = BookViewModel.init(book: book)
            booksVM.append(bookVM)
        }
        return booksVM
    }
    
}
