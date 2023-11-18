//
//  UserTableView.swift
//  Demo
//
//  Created by SENGHORT KHEANG on 11/17/23.
//

import UIKit
import Foundation

protocol UserTableViewDelegate {
    
}

protocol UserTableViewDataSource {
    func userItemLists() -> [ResponseModel]?
}

class UserTableView: UITableView {
    
    private var users: [ResponseModel]?
    var _delegate: UserTableViewDelegate?
    var _dataSource: UserTableViewDataSource?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.setupTable()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupTable()
    }
    
    override func reloadData() {
        users = _dataSource?.userItemLists() ?? []
        super.reloadData()
    }
    
    fileprivate func setupTable() {
        self.delegate   = self
        self.dataSource = self
        self.separatorStyle = .none
        self.rowHeight  = UITableView.automaticDimension
        self.register(UINib(nibName: "TimeSlotTableViewCell", bundle: nil), forCellReuseIdentifier: "timeSlotTableViewCell")
        self.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "userTableViewCell")
        self.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "serviceTableViewCell")
    }
}

extension UserTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "timeSlotTableViewCell", for: indexPath) as? TimeSlotTableViewCell else { return UITableViewCell() }
            cell.timeSlots = users![indexPath.row].timeSlots ?? []
            cell.timeSlotCollectionView.reloadData()
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "userTableViewCell", for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
            cell.users = users![indexPath.row].users ?? []
            cell.specialistCollectionView.reloadData()
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "serviceTableViewCell", for: indexPath) as? ServiceTableViewCell else { return UITableViewCell() }
            cell.services = users![indexPath.row].services ?? []
            cell.layoutIfNeeded()
            cell.serviceCollectionView.reloadData()
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

extension UserTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 300
        case 1: return 225
        case 2: return UITableView.automaticDimension
        default: return 0
        }
    }
}
