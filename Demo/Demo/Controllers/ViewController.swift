//
//  ViewController.swift
//  Demo
//
//  Created by SENGHORT KHEANG on 11/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var users: [ResponseModel] = [ResponseModel.results]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTable()
    }
}

extension ViewController {
    fileprivate func setupTable() {
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight  = UITableView.automaticDimension
        tableView.register(UINib(nibName: "TimeSlotTableViewCell", bundle: nil), forCellReuseIdentifier: "timeSlotTableViewCell")
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "userTableViewCell")
        tableView.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "serviceTableViewCell")
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "timeSlotTableViewCell", for: indexPath) as? TimeSlotTableViewCell else { return UITableViewCell() }
            cell.timeSlots = users[indexPath.row].timeSlots ?? []
            cell.timeSlotCollectionView.reloadData()
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "userTableViewCell", for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
            cell.users = users[indexPath.row].users ?? []
            cell.specialistCollectionView.reloadData()
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "serviceTableViewCell", for: indexPath) as? ServiceTableViewCell else { return UITableViewCell() }
            cell.services = users[indexPath.row].services ?? []
            cell.layoutIfNeeded()
            cell.serviceCollectionView.reloadData()
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 300
        case 1: return 225
        case 2: return UITableView.automaticDimension
        default: return 0
        }
    }
}
