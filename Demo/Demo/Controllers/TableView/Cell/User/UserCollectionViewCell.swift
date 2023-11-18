//
//  UserCollectionViewCell.swift
//  Demo
//
//  Created by SENGHORT KHEANG on 11/17/23.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectedPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    override var isSelected: Bool {
        didSet {
            selectedPicture.isHidden = isSelected ? false : true
            mainView.backgroundColor = isSelected ? .systemGreen.withAlphaComponent(0.2) : .white
        }
    }

    var user: UserDataModel? {
        didSet {
            guard let model = user else { return }
            nameLabel.text = model.name
            mainView.layer.cornerRadius = 7
            mainView.layer.borderWidth = 0.5
            mainView.layer.borderColor = UIColor.systemGreen.cgColor
        }
    }
}
