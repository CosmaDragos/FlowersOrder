//
//  FlowersDetailViewController.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 04/02/2020.
//

import Foundation
import UIKit

class FlowersDetailViewController: UIViewController {
    
    var viewModel: FlowersDetailViewModelProtocol!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var deliverToLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        descriptionLabel.text = viewModel.description
        deliverToLabel.text = viewModel.deliveredTo
        priceLabel.text = viewModel.price
        imageView.image = UIImage(named: viewModel.imageString) ?? UIImage()
    }
}
