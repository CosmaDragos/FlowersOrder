//
//  FlowersDetailViewModel.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 06/02/2020.
//  Copyright © 2020 NewBlack. All rights reserved.
//

import Foundation

protocol FlowersDetailViewModelProtocol {
    var description: String { get set }
    var price: Double { get set }
    var delivered_to: String { get set }
    var image_string: String { get set }
}

class FlowersDetailViewModelImplementation: FlowersDetailViewModelProtocol {
    var description: String
    
    var price: Double
    
    var delivered_to: String
    
    var image_string: String

    private let flower: Flower
    
    init(flower: Flower) {
        self.flower = flower
        description = flower.description
        price = flower.price
        delivered_to = flower.deliveredTo
        image_string = flower.imageString ?? ""
    }
}