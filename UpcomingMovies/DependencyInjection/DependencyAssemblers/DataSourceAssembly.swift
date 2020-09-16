//
//  DataSourceAssembly.swift
//  UpcomingMovies
//
//  Created by Alonso on 9/12/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
import UpcomingMoviesData
import CoreDataInfrastructure
import NetworkInfrastructure
import Swinject

class DataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(LocalDataSourceProtocol.self) { _ in
            return LocalDataSource()
        }
        container.register(RemoteDataSourceProtocol.self) { _ in
            return RemoteDataSource()
        }
    }
    
}