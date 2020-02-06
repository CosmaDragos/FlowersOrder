//
//  Configurator.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 05/02/2020.
//

import Foundation

protocol FlowerConfigurator {
    func configure(flowerViewController: FlowersOrderTableViewController)
}

class FlowerConfiguratorImplementation: FlowerConfigurator {
    
    func configure(flowerViewController: FlowersOrderTableViewController) {
        let service = FlowersOrderService()
        let viewModel : FlowersOrderViewModelProtocol  = FlowersOrderViewModelImplementation(service: service)
        flowerViewController.viewModel = viewModel
    }
}
