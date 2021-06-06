//
//  SearchMoviesTableViewController.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var viewModel: MoviesViewModelLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.lightGray
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.cellIdentifier)
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    func checkoutTableView(isHidden: Bool) {
        tableView.isHidden = isHidden
    }
}

extension MoviesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieCell else {
            assertionFailure("Cannot dequeue reusable cell")
            return UITableViewCell()
        }
        
        cell.bind(viewModel: viewModel.items.value[indexPath.row])

        //pagination
        if indexPath.row == viewModel.items.value.count - 2 {
            viewModel?.getMoviesNextPage { _ in }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath.row)
    }
}
