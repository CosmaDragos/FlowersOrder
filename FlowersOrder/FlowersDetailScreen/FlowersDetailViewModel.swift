//
//  FlowersDetailViewModel.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 06/02/2020.
//  Copyright © 2020 NewBlack. All rights reserved.
//

import Foundation

protocol FlowersDetailViewModelProtocol {
    var description: String { get }
    var price: String { get }
    var deliveredTo: String { get }
    var imageString: String { get }
}

class FlowersDetailViewModelImplementation: FlowersDetailViewModelProtocol {

    let description: String
    let price: String
    let deliveredTo: String
    let imageString: String
    
    private let flower: Flower
    
    init(flower: Flower) {
        self.flower = flower
        description = flower.description
        price = "\(flower.price)"
        deliveredTo = flower.deliveredTo
        imageString = flower.imageString ?? ""
    }
}
