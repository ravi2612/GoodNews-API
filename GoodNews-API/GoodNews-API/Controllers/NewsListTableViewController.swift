//
//  NewsListTableViewController.swift
//  GoodNews-API
//
//  Created by Ravi Navarro  on 09/09/21.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=c443126044a84e6ab5d3d5a68eb029c1")!
        
        WebServices().getArticles(url: url) {_ in
            
        }
    }
    
}

