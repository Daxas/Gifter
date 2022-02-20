//
//  Configurator.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import Foundation

class Configurator {
    static let shared = Configurator()
    let serviceLocator = ServiceLocator()
    
    func setup() {
        registerServices()
    }
    
   private func registerServices() {
       serviceLocator.addService(service: RepositoryService())
    }
}
