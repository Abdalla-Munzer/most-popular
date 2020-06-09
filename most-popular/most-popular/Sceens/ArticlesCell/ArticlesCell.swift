//
//  ArticlesCell.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright © 2020 com.most-popular. All rights reserved.
//

import UIKit
protocol ArticlesCellDelegate: CellableDelegate {
    func didSelectArticle(cell: ArticlesCell)
}
class ArticlesCell: UITableViewCell, Cellable {
    weak var delegate: CellableDelegate?
    weak var articlesCellDelegate: ArticlesCellDelegate?

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAbstract: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblPublishedDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func didMoveToWindow() {
        super.didMoveToWindow()
        if let delegate = delegate as? ArticlesCellDelegate {
            articlesCellDelegate = delegate
        }
    }
    func configure(_ object: Configurable) {
        if let articles = object as? Result {
            lblTitle.text = articles.title
            lblAbstract.text = articles.abstract
            lblType.text = articles.type
            lblPublishedDate.text = articles.publishedDate
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            articlesCellDelegate?.didSelectArticle(cell: self)
        }
        // Configure the view for the selected state
    }

}
