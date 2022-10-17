//
//  HomeModuleRemoteWorkerProtocols.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

/// Defines the remote worker capabilities
protocol HomeModuleRemoteWorkerProtocol: AnyObject {
    func fetchProducts()
}

/// Defines the remote worker callbacks
protocol HomeModuleRemoteWorkerOutputProtocol: AnyObject {
    func didFetchProducts(response: ApiResponseModel)
    func didFetchProductsWithError(error: String)
}


