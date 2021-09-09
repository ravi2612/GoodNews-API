//
//  ArticleViewModel.swift
//  GoodNews-API
//
//  Created by Ravi Navarro  on 09/09/21.
//

import Foundation


struct ArticleListViewModel {
    let articles: [Article]
}

#warning("Não precisa dessa extension, ah não ser que tu va dividir por sessões da ViewModel")
extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}






#warning("Não adicionar mais de um struct no mesmo arquivo, crie arquivos pra cada um")
struct ArticleViewModel {
    private let article: Article
}


extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    var description: String {
        return self.article.description
        
    }
    
}
