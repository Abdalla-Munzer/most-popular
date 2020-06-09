//
//  Cellable.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright © 2020 com.most-popular. All rights reserved.
//

import Foundation
protocol Configurable {}
@objc protocol CellableDelegate: class {}
protocol Cellable {
    func configure(_ object: Configurable)
    var delegate: CellableDelegate? {get set}
}
extension Cellable {
    var delegate: CellableDelegate? {
        get { return  nil } set {}
    }
}
