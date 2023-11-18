//
//  TimeSlotCollectionViewCell.swift
//  Demo
//
//  Created by SENGHORT KHEANG on 11/17/23.
//

import UIKit

class TimeSlotCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isSelected: Bool {
        didSet {
            timeLabel.textColor = isSelected ? .white : .black
            mainView.layer.borderColor = isSelected ? UIColor.clear.cgColor : UIColor.systemGreen.cgColor
            mainView.backgroundColor = isSelected ? .systemGreen : .white
        }
    }
    
    var timeSlot: TimeSlotModel? {
        didSet {
            guard let model = timeSlot else { return }
            timeLabel.text = model.time
            mainView.layer.borderWidth = 0.5
            mainView.backgroundColor = (model.status == .booking) ? .systemGray5.withAlphaComponent(0.5) : .white
            self.isUserInteractionEnabled = (model.status == .booking) ? false : true
        }
    }
}
