//
//  FlowersOrderModelView.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 04/02/2020.
//

import Foundation

protocol FlowersOrderViewModelProtocol {
    var viewModelCells: [FlowerCellViewModelProtocol] { get }
    func loadFlowers(completion: @escaping () -> Void)
}

class FlowersOrderViewModelImplementation: FlowersOrderViewModelProtocol {
    
    var flowers: [Flower] = []
    var viewModelCells: [FlowerCellViewModelProtocol] = []
    
    private let service: FlowersOrderService
    
    init(service: FlowersOrderService) {
        self.service = service
    }
    
    func loadFlowers(completion: @escaping () -> Void) {
        service.parseData(flowerHandler: { [weak self] flowers in
            self?.flowers = flowers
            self?.mapFlowersToViewModel()
            completion()
        })
    }
    
    func mapFlowersToViewModel() {
        viewModelCells = flowers.map {
            FlowerCellViewModelImplementation(flower: $0)
        }
    }
}
