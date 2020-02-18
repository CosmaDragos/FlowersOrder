//
//  Configurator.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 05/02/2020.
//

import Foundation
import UIKit

protocol FlowerConfigurator {
    func configure(flowerViewController: FlowersOrderTableViewController)
}

class FlowerConfiguratorImplementation: FlowerConfigurator {
    
    fileprivate var presentViewController: UIViewController = UIViewController()
    
    func configure(flowerViewController: FlowersOrderTableViewController) {
        let service = FlowersOrderService()
        var viewModel : FlowersOrderViewModelProtocol  = FlowersOrderViewModelImplementation(service: service)
        viewModel.flowDelegate = self
        
        flowerViewController.viewModel = viewModel
        presentViewController = flowerViewController
    }
}

extension FlowerConfiguratorImplementation: FlowersOrderFlowDelegate {
    
    func didSelect(flower: Flower, on flowerViewModel: FlowersOrderViewModelProtocol) {
        guard let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FlowersDetailStoryboard") as? FlowersDetailViewController else { return }
        let viewModel: FlowersDetailViewModelProtocol = FlowersDetailViewModelImplementation(flower: flower)
        viewController.viewModel = viewModel
        
        presentViewController.present(viewController, animated: true)
    }
}
