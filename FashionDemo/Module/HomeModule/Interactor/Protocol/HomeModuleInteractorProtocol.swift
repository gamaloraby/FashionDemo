//
//  HomeModuleInteractorProtocol.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

/// Defines the interactor capabilities
protocol HomeModuleInteractorProtocol: AnyObject {
   func fetchProducts()
}

//
/// Defines the interactor callbacks to presenter
protocol HomeModuleInteractorOutputProtocol: AnyObject {
    func didFetchProducts(response: ApiResponseModel)
    func didFetchProductsWithError(error: String)
}
