//
//  ArticlesViewController.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright (c) 2020 com.most-popular. All rights reserved.

import UIKit

final class ArticlesViewController: UIViewController {

    // MARK: - Properties
    var configurator: ArticlesConfigurator! {
        didSet {
            configurator.configureWith(viewController: self)
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let refreshControl = UIRefreshControl()
            tableView.refreshControl = refreshControl
            refreshControl.addTarget(self, action: #selector(refreshUpdate), for: .valueChanged)
        }
    }
	var output: ArticlesViewOutput!
	var router: ArticlesRouter!
    var articles: Articles?
    var updateSection: TableViewSection<Result, ArticlesCell>!
    var tableViewAdapter: TableViewAdapter!

}

// MARK: - View lifecycle
extension ArticlesViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewDidLoad()
        self.view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
	}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.viewWillDisappear()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }

}

extension ArticlesViewController {

}

// MARK: - Private
private extension ArticlesViewController {
    @objc func refreshUpdate() {
        tableView.refreshControl?.endRefreshing()
        self.view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        self.output.getMostPopularArticles()
    }

     func loadTableView(with viewModel: [Result]) {
        updateSection = TableViewSection<Result, ArticlesCell>(items: viewModel, delegate: self)
        tableViewAdapter = TableViewAdapter(sections: [updateSection])
        tableViewAdapter.tableViewRowHeight = 200
        tableView?.setAdapter(tableViewAdapter)
    }
}

// MARK: - ArticlesPresenterOutput
extension ArticlesViewController: ArticlesPresenterOutput {
    func getMostPopularArticlesSuccess(articles: Articles?) {
        self.view.activityStopAnimating()
        guard let results = articles?.results else {
            self.showAlertWith(title: "Error", message: "No Data")
            return
        }
        self.articles = articles
        loadTableView(with: results)
    }

    func getMostPopularArticlesFailed(error: Error?) {
        self.view.activityStopAnimating()
        self.showAlertWith(title: "Error", message: error?.localizedDescription ?? "Try agin")
    }
}
extension ArticlesViewController: ArticlesCellDelegate {
    func didSelectArticle(cell: ArticlesCell) {
        guard let index = tableView?.indexPath(for: cell) else { return }
    }
}
