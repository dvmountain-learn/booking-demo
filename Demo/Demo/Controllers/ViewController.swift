//
//  ViewController.swift
//  Demo
//
//  Created by SENGHORT KHEANG on 11/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UserTableView! {
        didSet {
            self.tableView._dataSource = self
        }
    }
    fileprivate var users: [ResponseModel] = [ResponseModel.results]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UserTableViewDataSource {
    func userItemLists() -> [ResponseModel]? {
        return users
    }
}
