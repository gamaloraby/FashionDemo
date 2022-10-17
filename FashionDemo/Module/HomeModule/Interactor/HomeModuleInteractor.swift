//
//  HomeModuleInteractor.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

class HomeModuleInteractor: HomeModuleInteractorProtocol {

    weak var presenter: HomeModuleInteractorOutputProtocol?
    var remoteWorker: HomeModuleRemoteWorkerProtocol?
    init(remoteWorker: HomeModuleRemoteWorkerProtocol) {
        self.remoteWorker = remoteWorker
    }
    
    func fetchProducts() {
        remoteWorker?.fetchProducts()
    }
}

// MARK: - Remote Callbacks

extension HomeModuleInteractor: HomeModuleRemoteWorkerOutputProtocol {
    func didFetchProducts(response: ApiResponseModel) {
        presenter?.didFetchProducts(response: response)
    }
    
    func didFetchProductsWithError(error: String) {
        presenter?.didFetchProductsWithError(error: error)
    }
}
