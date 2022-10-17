//
//  SelectedProductsInteractor.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

class SelectedProductsInteractor:  SelectedProductsInteractorProtocol {
    
    weak var presenter: SelectedProductsInteractorOutputProtocol?
    
    /// Initialize the interactor with the required parameters to work properly
    /// - Parameter remoteWorker: The remote worker to load the data remotely
//    init(remoteWorker: SelectedProductsRemoteWorkerProtocol) {
//        self.remoteWorker = remoteWorker
//    }
    
}

// MARK: - Remote Callbacks

//extension SelectedProductsInteractor: SelectedProductsRemoteWorkerOutputProtocol {
//}
