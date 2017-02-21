//
//  CustomCellDelegate.swift
//  TodoApp
//
//  Created by Guilherme Morais on 2017-02-18.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//  Student #300878610

import Foundation

//protocol to handle custom cell segue to details view
protocol CustomCellDelegate {
    func callSegueFromCell(myData dataobject: String)
}
