//
//  CustomCellDelegate.swift
//  TodoApp
//
//  Created by Guilherme Morais on 2017-02-18.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import Foundation

protocol CustomCellDelegate {
    func callSegueFromCell(myData dataobject: String)
}
