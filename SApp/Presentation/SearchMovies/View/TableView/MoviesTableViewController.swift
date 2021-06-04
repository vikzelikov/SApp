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
//        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.cellIdentifier)
    }
    
    func reload() {
        tableView.reloadData()
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

        //Pagination?
//        if indexPath.row == viewModel.items.value.count - 1 {
//            viewModel.didLoadNextPage()
//        }
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return viewModel.isEmpty ? tableView.frame.height : super.tableView(tableView, heightForRowAt: indexPath)
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.didSelectItem(at: indexPath.row)
//    }
}
