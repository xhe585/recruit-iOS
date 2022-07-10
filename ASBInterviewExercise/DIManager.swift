//
//  DIManager.swift
//  ASBInterviewExercise
//
//  Created by ASB on 29/07/21.
//

import Foundation
import Swinject
import SwinjectStoryboard

class DIManager {
    static let shared = DIManager()
    
    var assembler: Assembler
    
    init() {
        let assembler = Assembler([ServiceAssembly(), ViewControllerAssembly()], container: SwinjectStoryboard.defaultContainer)
        self.assembler = assembler
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        return assembler.resolver.resolve(type)
    }
}

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RestClient.self) { resolver in
            return RestClient()
        }.inObjectScope(.transient)
        
        container.register(TransactionApiService.self) { resolver in
            return TransactionApiService(restClient: resolver.resolve(RestClient.self)!)
        }.inObjectScope(.transient)
        

    }
}

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MainViewController.self) { r in
            let controller = MainViewController()
            controller.apiService = r.resolve(TransactionApiService.self)
            return controller
        }.inObjectScope(.transient)
        
        container.register(TransactionDetailViewController.self) { r in
            let controller = TransactionDetailViewController()
            return controller
        }.inObjectScope(.transient)
    }
}
