//
//  ViewController.swift
//  AlExtensions
//
//  Created by sonifex on 02/07/2019.
//  Copyright (c) 2019 sonifex. All rights reserved.
//

import UIKit
import AlExtensions

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


        let img = UIImage(named: "test")
        _ = UIColor.hex(hex: "ffffff")
        _ = img?.colorized(with: .red)

        let tableView = UITableView()
        tableView.registerNib(UITableViewCell.self)


        let text = "Soner "
        print(text.trim())

        let arr = ["soner","ahmet"]
        let item = arr[safe: 0]
    }
}

