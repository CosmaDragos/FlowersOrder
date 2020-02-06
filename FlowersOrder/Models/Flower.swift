//
//  Flower.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 03/02/2020.
//

import Foundation

struct Flower: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case price
        case deliveredTo = "deliver_to"
        case imageString
    }
    
    let id: Int
    let description: String
    let price: Double
    let deliveredTo: String
    let imageString: String?
}
