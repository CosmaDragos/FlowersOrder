//
//  FlowersOrderService.swift
//  FlowersOrder
//
//  Created by Dragos Cosma on 04/02/2020.
//

import Foundation

class FlowersOrderService {
    
    func parseData(result: @escaping (Result<[Flower], Error>) -> Void) {
        if let url = URL(string: "http://demo2449505.mockable.io/") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data else { return }
                    do {
                        let res = try JSONDecoder().decode([Flower].self, from: data)
                        result(.success(res))
                    } catch let error {
                        result(.failure(error))
                    }
                }
            }.resume()
        }
    }
}
