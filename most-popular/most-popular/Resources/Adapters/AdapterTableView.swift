//
//  AdapterTableView.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright © 2020 com.most-popular. All rights reserved.
//

import Foundation
import UIKit

protocol ConfigurableSection {
    var count: Int { get }
    var identifier: String {get set}
    var elements: [Configurable] { get }
    var delegate: CellableDelegate? { get }
    func selected(at indexPath: IndexPath)
    func deSelected(at indexPath: IndexPath)
}
struct TableViewHeaderConfig {
    var cell: Cellable.Type
    var heightHeader: CGFloat
    var model: [Configurable]
}

class TableViewAdapter: NSObject {
    let sections: [ConfigurableSection]
    var tableViewHeaderConfig: TableViewHeaderConfig?
    var arrayListTitles: [String]?
    var tableViewRowHeight: CGFloat?

    init(sections: [ConfigurableSection], tableViewHeaderConfig: TableViewHeaderConfig? = nil ) {
        self.sections = sections
        self.tableViewHeaderConfig = tableViewHeaderConfig
    }
}

extension TableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        guard var cell = tableView.dequeueReusableCell(withIdentifier: section.identifier) as? Cellable & UITableViewCell else {
            return UITableViewCell()
        }
      //  cell.selectionStyle = .none
        cell.delegate = section.delegate
        //cell.indexPath = indexPath
        cell.configure(section.elements[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewRowHeight ?? UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        section.selected(at: indexPath)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        section.deSelected(at: indexPath)
    }
    // Header Configration

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if let config = tableViewHeaderConfig {

            guard let  cell  = tableView.dequeueReusableCell(withIdentifier: "\(config.cell.self)") as? Cellable & UITableViewCell else {
                return nil
            }

            cell.configure(config.model[section])
            return cell
        }

        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return tableViewHeaderConfig?.heightHeader ?? CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arrayListTitles
    }
}

class TableViewSection<Model: Configurable, Cell>: ConfigurableSection where Cell: UITableViewCell & Cellable {

    weak var delegate: CellableDelegate?

    var elements: [Configurable] {

        return items
    }

    var identifier: String

    typealias ModelCellClosure = (Model, IndexPath) -> Void

    private var items: [Model]

    var didSelect: ModelCellClosure?
    var didDeSelect: ModelCellClosure?

    var count: Int {
        return items.count
    }

    init(items: [Model], delegate: CellableDelegate? = nil) {
        self.items = items
        self.identifier = "\(Cell.self)"
        self.delegate = delegate
    }

    func selected(at indexPath: IndexPath) {
        let selected = items[indexPath.row]
        didSelect?(selected, indexPath)
    }
    func deSelected(at indexPath: IndexPath) {
        let selected = items[indexPath.row]
        didDeSelect?(selected, indexPath)
    }
    func updateData(_ items: [Model] ) {
        self.items = items
    }
}

extension UITableView {
    func setAdapter(_ adapter: TableViewAdapter) {
        dataSource = adapter
        delegate = adapter
        reloadData()
    }
}
