//
//  FlowersOrderModelView.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 04/02/2020.
//

import Foundation
import UIKit

protocol FlowersOrderFlowDelegate: class {
    func didSelect(flower: Flower, on flowerViewModel: FlowersOrderViewModelProtocol)
}

protocol FlowersOrderViewModelProtocol {
    var viewModelCells: [FlowerCellViewModelProtocol] { get }
    var flowDelegate: FlowersOrderFlowDelegate? { get set }
    
    func loadFlowers(completion: @escaping () -> Void)
    func didSelectFlower(at indexPath: IndexPath)
}

class FlowersOrderViewModelImplementation: FlowersOrderViewModelProtocol {
    
    var flowers: [Flower] = []
    var viewModelCells: [FlowerCellViewModelProtocol] = []
    var flowDelegate: FlowersOrderFlowDelegate?
    
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
    
    func didSelectFlower(at indexPath: IndexPath) {
        flowDelegate?.didSelect(flower: flowers[indexPath.row], on: self)
    }
}
