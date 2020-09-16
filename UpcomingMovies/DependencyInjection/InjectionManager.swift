//
//  InjectionManager.swift
//  UpcomingMovies
//
//  Created by Alonso on 9/13/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
import Swinject

class InjectionManager {
    
    static let shared = InjectionManager()
    
    let container: Container = Container()
    let assembler: Assembler
    
    init() {
        assembler = Assembler(
            [
                DataSourceAssembly(),
                ProviderAssembly(),
                HandlerAssembly(),
                SceneAssembly()
            ],
            container: container)
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        guard let resolvedType = container.resolve(type) else {
            fatalError()
        }
        return resolvedType
    }
    
    func resolve<T>(_ type: T.Type, name: String) -> T {
        guard let resolvedType = container.resolve(type, name: name) else {
            fatalError()
        }
        return resolvedType
    }
    
    func resolve<T, U>(_ type: T.Type, argument: U) -> T {
        guard let resolvedType = container.resolve(type, argument: argument) else {
            fatalError()
        }
        return resolvedType
    }
    
}