//
//  ProductsListViewController.swift
//  ShopifyCodingChallenge
//
//  Created by Nick Sentjens on 2018-09-19.
//  Copyright © 2018 NickSentjens. All rights reserved.
//

import Foundation
import UIKit


class ProductsListViewController: UIViewController  {
    
    private var products: [Product] = []
    
    init(products: [Product]) {
        self.products = products
        super.init(nibName: nil, bundle: nil)
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("Products", comment: "Products list title")
        
        setUpTableView()
    }
    
    private func setUpTableView() {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductListCell.self, forCellReuseIdentifier: "ProductListCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 150 / 225,
                                            green: 191 / 225,
                                            blue: 72 / 225,
                                            alpha: 1)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        
        tableView.reloadData()
    }
}

extension ProductsListViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell") as? ProductListCell else {
            return UITableViewCell()
        }
        let product = products[indexPath.row]
        cell.inventoryLabel.text = String(product.inventoryQuantity)
        cell.nameLabel.text = product.title
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: product.image.imageURL)
            DispatchQueue.main.async {
                if let data = data {
                    cell.productImageView.image = UIImage(data: data)
                }
            }
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
