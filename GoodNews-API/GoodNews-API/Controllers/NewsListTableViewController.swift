//
//  NewsListTableViewController.swift
//  GoodNews-API
//
//  Created by Ravi Navarro  on 09/09/21.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2021-09-09&sortBy=popularity&apiKey=c443126044a84e6ab5d3d5a68eb029c1")!
        
        #warning("Essa chamada deveria estar na ViewModel, sendo acessada por meio de um método da viewModel")
        /*
         Fluxo certo ===>
         ViewController (pede pra view model dados dos artigos) ->
         ViewModel (Pede pra service carregar os dados e espera) ->
         WebService (Carrega os dados, devolve pra view model) ->
         ViewModel (Com dados carregados devolve pra view controller) ->
         ViewController (Atualiza a view) -> FIM
         */
        WebService().getArticles(url: url) { articles in
            
            if let articles = articles {
            
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
       
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // MARK: Sugestão de melhoria 👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇
        /*
         if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.cellIdentifier, for: indexPath) as? ArticleTableViewCell {
         let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
         cell.setupView(titleText: articleVM.title, descriptionText: articleVM.description)
         return cell
         }
         
         /// O método pede um retorno, como o retorno está dentro do if let vc tem que colocar um fora dele padrão.
         return UITableViewCell()
         */
        #warning("Identifier da cell poderia ser uma constante estatica da propria celula, podendo ser acessada como ArticleTableViewCell.cellIDentifier.")
        #warning("Trocar o guard let por um if let")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            #warning("Fatal errors geram crashs no app, não pode deixar aí, em desenvolvimento tudo bem, mas não esquece")
            fatalError("ArticleTableViewCell not found")
        }
       let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        #warning("olhar warning na ArticleTableViewCell")
        #warning("Aqui deveria ser um método, exemplo => cell.setupView(titleText: articleVM.title, descriptionText: articleVM.description)")
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
    
}

