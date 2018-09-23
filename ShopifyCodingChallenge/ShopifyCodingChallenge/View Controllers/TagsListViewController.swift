//
//  TagsListViewController.swift
//  ShopifyCodingChallenge
//
//  Created by Nick Sentjens on 2018-09-19.
//  Copyright © 2018 NickSentjens. All rights reserved.
//

import Foundation
import UIKit


class TagsListViewController: UIViewController  {
    private var tableView: UITableView?
    
    private var tags: [String] = []
    
    // key will be the tag, value will be the products that have that key
    private var productsDictionary : [String: [Product]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("Tags", comment: "Tags list title")
        
        setUpTableView()
        
        fetchProductList()
    }
    
    private func setUpTableView() {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TagsListCell.self, forCellReuseIdentifier: "TagsListCell")
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 150 / 225,
                                            green: 191 / 225,
                                            blue: 72 / 225,
                                            alpha: 1)
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        
        self.tableView = tableView
    }
    
    private func fetchProductList() {
        guard let networkCallURL = URL(string: "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6") else {
            return
        }
        
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: networkCallURL) { data, response, error in
            if error == nil {
                if let data = data,
                let productsResponse = try? JSONDecoder().decode(ProductsResponse.self, from: data) {
                    productsResponse.products.forEach { product in
                        product.tags.forEach { tag in
                            if var productsWithTag = self.productsDictionary[tag] {
                                productsWithTag.append(product)
                                self.productsDictionary[tag] = productsWithTag
                            } else {
                                self.productsDictionary[tag] = [product]
                            }

                            if self.tags.contains(tag) == false {
                                self.tags.append(tag)
                            }
                        }
                    }
                    self.tableView?.reloadData()
                } else {
                    //failed to decode data
                }
            }
        }
        
        task.resume()
    }
}

extension TagsListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TagsListCell") as? TagsListCell else {
            return UITableViewCell()
        }
        cell.tagLabel.text = tags[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let tag = tags[indexPath.row]
        
        guard let productsAssociatedWithTag = productsDictionary[tag] else {
            return
        }
        
        let productsViewController = ProductsListViewController(products: productsAssociatedWithTag)
        self.navigationController?.pushViewController(productsViewController, animated: true)
    }
}
