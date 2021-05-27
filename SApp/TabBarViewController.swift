//
//  TabBarViewController.swift
//  SApp
//
//  Created by Yegor on 24.05.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        
        tabBar.barTintColor = .white
    }
    
    
    func setupTabBar() {

        let searchMovies = UIStoryboard(name: "SearchMovies", bundle: nil)
        guard let firstVC = searchMovies.instantiateViewController(withIdentifier: "SearchMoviesViewController") as? SearchMoviesViewController else { return }
        firstVC.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 0)

        let favoriteMovies = UIStoryboard(name: "FavoriteMovies", bundle: nil)
        guard let secondVC = favoriteMovies.instantiateViewController(withIdentifier: "FavoriteMoviesViewController") as? FavoriteMoviesViewController else { return }
        secondVC.tabBarItem = UITabBarItem(title: "Favorites", image: nil, tag: 1)


        let tabBarList = [firstVC, secondVC]
        
        viewControllers = tabBarList
    }
}

