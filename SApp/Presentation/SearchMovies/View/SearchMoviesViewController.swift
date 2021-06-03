//
//  SearchMoviesController.swift
//  SApp
//
//  Created by Yegor on 25.05.2021.
//

import UIKit

class SearchMoviesViewController: UIViewController {
    
    @IBOutlet private var searchBarContainer: UIView!
    
    private var viewModel: MoviesViewModelLogic?
    private var moviesTableViewController: MoviesTableViewController?
    private var searchController = UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
//        title = viewModel.screenTitle
        setupSearchController()
    }
    
    private func updateItems() {
        moviesTableViewController?.reload()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewModel = MoviesViewModel()
        
        if segue.identifier == String(describing: MoviesTableViewController.self),
           let destinationVC = segue.destination as? MoviesTableViewController {
            moviesTableViewController = destinationVC
            moviesTableViewController?.viewModel = viewModel
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.isActive = false
    }
    
}

extension SearchMoviesViewController {
    private func setupSearchController() {
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
//        searchController.searchBar.placeholder = viewModel.searchBarPlaceholder
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.barStyle = .default
        searchController.hidesNavigationBarDuringPresentation = false
        searchBarContainer.addSubview(searchController.searchBar)
    }
}

extension SearchMoviesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchController.isActive = false
        viewModel?.search(query: searchText)
        
        moviesTableViewController?.reload()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.cancelSearch()
    }
}

extension SearchMoviesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
//        var searchText = searchController.searchBar.text
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

    

