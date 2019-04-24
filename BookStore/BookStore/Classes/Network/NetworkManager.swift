//
//  NetworkManager.swift
//  BookStore
//
//  Created by Maria Ortega on 24/04/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

// MARK: - Protocol

protocol NetworkManagerProtocol {
    
    func fetchListBooks(completion: @escaping (Result<Array<Book>>) -> ())
    
    func fetchBook(id: Int, completion: @escaping (Result<Book>) -> ())
}


class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Properties

    let session = URLSession.shared

    // MARK: - URL Data
    
    private func booksURLFromParameters() -> URL {
        
        // Build URL
        var components = URLComponents()
        components.scheme = Constants.BookURLParams.APIScheme
        components.host = Constants.BookURLParams.APIHost
        components.path = Constants.BookURLParams.APIPath
        
        return components.url!
    }
    
    // MARK: - Fetch List Books
    
    func fetchListBooks(completion: @escaping (Result<Array<Book>>) -> ()) {
        let request = URLRequest(url: booksURLFromParameters())
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if (error == nil) {
                
                // Check response code
                let status = (response as! HTTPURLResponse).statusCode
                if (status < 200 || status > 300) {
                    completion(Result.error(.noConnection))
                }
                
                // Check data
                guard let data = data else {
                    completion(Result.error(.noData))
                    return
                }
                
                // Check the JSON data
                let jsonData: [[String:AnyObject]]!
                do {
                    jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:AnyObject]]
                } catch {
                    completion(Result.error(.noData))
                    return
                }
                
                // Check if there is data coming in
                if jsonData.count == 0 {
                    completion(Result.error(.emptyData))
                } else {
                    let books = Parser.parseListBooks(array: jsonData)
                    completion(Result.results(books))
                }
            }
            else {
                completion(Result.error(.genericError))
            }
        }
        task.resume()
    }
    
    // MARK: - Fetch Book

    func fetchBook(id: Int, completion: @escaping (Result<Book>) -> ()) {
        let request = URLRequest(url: booksURLFromParameters())
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if (error == nil) {
                
                // Check response code
                let status = (response as! HTTPURLResponse).statusCode
                if (status < 200 || status > 300) {
                    completion(Result.error(.noConnection))
                }
                
                // Check data
                guard let data = data else {
                    completion(Result.error(.noData))
                    return
                }
                
                // Check the JSON data
                let jsonData: [String:AnyObject]!
                do {
                    jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]
                } catch {
                    completion(Result.error(.noData))
                    return
                }
                
                if let book = Parser.parseBook(dictionary: jsonData) {
                    completion(Result.results(book))
                } else {
                    completion(Result.error(.emptyData))
                }
            }
            else {
                completion(Result.error(.genericError))
            }
        }
        task.resume()
    }
}
