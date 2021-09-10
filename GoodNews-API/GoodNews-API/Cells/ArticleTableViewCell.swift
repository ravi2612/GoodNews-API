//
//  ArticleTableViewCell.swift
//  GoodNews-API
//
//  Created by Ravi Navarro  on 09/09/21.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    /*
     let static cellIdentifier = "ArticleTableViewCell"
     */
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    #warning("Cria um método de setupView() com todos dados que precisa, exemplo => setupView(titleText: String?, descriptionText: String?)")
    
    /*
     Solução:
     
     func setupView(titleText: String?, descriptionText: String?) {
         self.titleLabel.text = titleText
         self.descriptionLabel.text = descriptionText
     }
     */
    
}
