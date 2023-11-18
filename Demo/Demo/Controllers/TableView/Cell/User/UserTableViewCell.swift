//
//  UserTableViewCell.swift
//  Demo
//
//  Created by SENGHORT KHEANG on 11/17/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var specialistCollectionView: UICollectionView!
    
    var users: [UserDataModel] = []
    private (set) var selectedIndex: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupCollection() {
        specialistCollectionView.delegate = self
        specialistCollectionView.dataSource = self
        specialistCollectionView.register(UINib(nibName: "UserCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "userCollectionViewCell")
    }
    
    fileprivate func selectCell(forIndexPath indexPath: IndexPath) {
        specialistCollectionView.scrollToItem(
            at: indexPath,
            at: .centeredHorizontally,
            animated: true
        )
        //deselect
        let prevIndexPath = IndexPath(item: selectedIndex, section: 0)
        if let prevCell = specialistCollectionView.cellForItem(at: prevIndexPath) {
            prevCell.isSelected = false
        }
        //select
        if let cell = specialistCollectionView.cellForItem(at: indexPath) as? UserCollectionViewCell {
            cell.isSelected = true
        }
        selectedIndex = indexPath.row
    }
}

extension UserTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCollectionViewCell", for: indexPath) as? UserCollectionViewCell else { return UICollectionViewCell() }
        cell.user = users[indexPath.row]
        cell.isSelected = indexPath.row == selectedIndex
        
        return cell
    }
}

extension UserTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCell(forIndexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: (screenWidth/2.5)-15, height: 165)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
