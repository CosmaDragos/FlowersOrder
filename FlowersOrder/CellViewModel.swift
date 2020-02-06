//
//  CellViewModel.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 04/02/2020.
//

import Foundation

protocol FlowerCellViewModelProtocol {
    var description: String { get }
    var price: String { get }
    var deliveredTo: String { get }
    var imageString: String { get }
}

class FlowerCellViewModelImplementation: FlowerCellViewModelProtocol {
    let deliveredTo: String
    let imageString: String
    let description: String
    let price: String
    
    init(flower: Flower) {
        description = flower.description
        price = "\(flower.price)"
        deliveredTo = flower.deliveredTo
        imageString = flower.imageString ?? ""
    }
}
