//
//  ViewController.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 03/02/2020.
//

import UIKit

enum CellIdentifier: String {
    case FlowerTableViewCellIdentifier
}


class FlowersOrderTableViewController: UITableViewController {
    
    var viewModel: FlowersOrderViewModelProtocol?
    private let configurator: FlowerConfigurator = FlowerConfiguratorImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(flowerViewController: self)
        viewModel?.loadFlowers {
            self.tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.viewModelCells.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType: CellIdentifier = CellIdentifier.FlowerTableViewCellIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! FlowersOrderTableViewCell
        cell.viewModel = viewModel?.viewModelCells[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = UIStoryboard(name: "Main", bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "FlowersDetailStoryboard")
            as? FlowersDetailViewController else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        self.present(detailViewController, animated: true)
    }
    
}

