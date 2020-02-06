//
//  TableViewCell.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 03/02/2020.
//

import UIKit

class FlowersOrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var smallImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: FlowerCellViewModelProtocol? {
        didSet {
            setupCell()
        }
    }
    
    @IBOutlet weak var deliveredToLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        smallImage.layer.cornerRadius = smallImage.bounds.width / 2
        smallImage.clipsToBounds = true
    }
    
    func setupCell() {
        descriptionLabel.text = viewModel?.description
        priceLabel.text = viewModel?.price
        deliveredToLabel.text = viewModel?.deliveredTo
        smallImage.image = UIImage(named: viewModel?.imageString ?? "")
    }
}
