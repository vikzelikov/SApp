//
//  SearchMoviesController.swift
//  SApp
//
//  Created by Yegor on 25.05.2021.
//

import UIKit

class SearchMoviesViewController: UIViewController {
    
    var viewModel: MoviesViewModel!
    
    private var moviesTableViewController: MoviesTableViewController?
    
    @IBOutlet private var searchBarContainer: UIView!
    
    private var searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
//        bind(viewModel: viewModel)
    }
    
    private func setupViews() {
//        title = viewModel.screenTitle
        title = "Hello!!"
        setupSearchController()
    }

    private func bind(viewModel: MoviesViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateItems() }
    }
    
    private func updateItems() {
        moviesTableViewController?.reload()
    }
    

}

extension SearchMoviesViewController {
    private func setupSearchController() {
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search!"
//        searchController.searchBar.placeholder = viewModel.searchBarPlaceholder
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = true
        searchController.searchBar.barStyle = .black
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.frame = searchBarContainer.bounds
        searchController.searchBar.autoresizingMask = [.flexibleWidth]
        searchBarContainer.addSubview(searchController.searchBar)
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        if #available(iOS 13.0, *) {
//            searchController.searchBar.searchTextField.accessibilityIdentifier = AccessibilityIdentifier.searchField
        }
    }
}

extension SearchMoviesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchController.isActive = false
//        viewModel.didSearch(query: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        viewModel.didCancelSearch()
    }
}

extension SearchMoviesViewController: UISearchControllerDelegate {
//    public func willPresentSearchController(_ searchController: UISearchController) {
//        updateQueriesSuggestions()
//    }
//
//    public func willDismissSearchController(_ searchController: UISearchController) {
//        updateQueriesSuggestions()
//    }
//
//    public func didDismissSearchController(_ searchController: UISearchController) {
//        updateQueriesSuggestions()
//    }
}


    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return viewModel.isEmpty ? tableView.frame.height : super.tableView(tableView, heightForRowAt: indexPath)
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.didSelectItem(at: indexPath.row)
//    }
    

