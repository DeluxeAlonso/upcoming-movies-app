//
//  SimpleCollectionViewDataSource.swift
//  UpcomingMovies
//
//  Created by Alonso on 2/9/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import UIKit

class SimpleCollectionViewDataSource<ViewModel>: NSObject, UICollectionViewDataSource {
    
    typealias CellConfigurator = (ViewModel, UICollectionViewCell) -> Void
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    private var cellViewModels: [ViewModel]
    
    // MARK: - Initializers
    
    init(cellViewModels: [ViewModel], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.cellViewModels = cellViewModels
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = cellViewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(viewModel, cell)
        return cell
    }

}

extension SimpleCollectionViewDataSource where ViewModel == UpcomingMovieCellViewModel {
    
    static func make(for cellViewModels: [UpcomingMovieCellViewModel],
                     reuseIdentifier: String = UpcomingMovieCollectionViewCell.identifier) -> SimpleCollectionViewDataSource {
        return SimpleCollectionViewDataSource(cellViewModels: cellViewModels,
                                              reuseIdentifier: reuseIdentifier,
                                              cellConfigurator: { (viewModel, cell) in
                                                let cell = cell as! UpcomingMovieCollectionViewCell
                                                cell.viewModel = viewModel
        })
    }
    
}
