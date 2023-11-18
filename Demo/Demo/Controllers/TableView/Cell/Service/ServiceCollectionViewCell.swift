//
//  ServiceCollectionViewCell.swift
//  Demo
//
//  Created by SENGHORT KHEANG on 11/17/23.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .white : .black
            subTitleLabel.textColor = isSelected ? .white : .black
            mainView.layer.borderColor = isSelected ? UIColor.clear.cgColor : UIColor.systemGreen.cgColor
            mainView.backgroundColor = isSelected ? .systemGreen : .white
        }
    }
    
    var service: ServiceModel? {
        didSet {
            guard let model = service else { return }
            titleLabel.text = model.name
            subTitleLabel.text = model.description
            mainView.layer.cornerRadius = 7
            mainView.layer.borderWidth = 0.5
            mainView.layer.borderColor = UIColor.systemGreen.cgColor
        }
    }
}
