//
//  HomeModuleRemoteWorker.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

class HomeModuleRemoteWorker: HomeModuleRemoteWorkerProtocol {
   
    var serviceName: HomeServicesProtocol?
    
    weak var interactor: HomeModuleRemoteWorkerOutputProtocol?
    
    init(serviceName: HomeServicesProtocol?) {
        self.serviceName = serviceName
    }
    
    func fetchProducts() {
        serviceName?.getProducts()
    }
    
}

extension HomeModuleRemoteWorker: HomeServicesDelegate {
    func didGetProductsWithError(error: String) {
        interactor?.didFetchProductsWithError(error: error)
    }
    
    func didGetProductst(response: ApiResponseModel) {
        interactor?.didFetchProducts(response: response)
    }
}
