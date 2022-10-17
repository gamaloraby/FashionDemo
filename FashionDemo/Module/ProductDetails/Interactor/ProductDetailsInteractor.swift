//
//  ProductDetailsInteractor.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

class ProductDetailsInteractor: ProductDetailsInteractorProtocol {
    
    weak var presenter: ProductDetailsInteractorOutputProtocol?
    
    /// Initialize the interactor with the required parameters to work properly
    /// - Parameter remoteWorker: The remote worker to load the data remotely
//    init(remoteWorker: ProductDetailsRemoteWorkerProtocol) {
//        self.remoteWorker = remoteWorker
//    }
    
}

// MARK: - Remote Callbacks

//extension ProductDetailsInteractor: ProductDetailsRemoteWorkerOutputProtocol {
//}
