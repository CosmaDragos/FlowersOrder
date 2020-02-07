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
    var delivered_to: String { get }
    var image_string: String { get }
}

class FlowersDetailViewModelImplementation: FlowersDetailViewModelProtocol {

    let description: String
    let price: String
    let delivered_to: String
    let image_string: String
    
    private let flower: Flower
    
    init(flower: Flower) {
        self.flower = flower
        description = flower.description
        price = "\(flower.price)"
        delivered_to = flower.deliveredTo
        image_string = flower.imageString ?? ""
    }
}
