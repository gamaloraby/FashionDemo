//
//  HomeServices.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation
import Moya

protocol HomeServicesProtocol {
    func getProducts()
}

protocol HomeServicesDelegate: AnyObject {
    func didGetProductsWithError(error: String)
    func didGetProductst(response: ApiResponseModel)
}

class HomeServices: HomeServicesProtocol {
    weak var delegate: HomeServicesDelegate?
    func getProducts() {
        let provider = MoyaProvider<Services>()
        provider.request(.getProducts) { result in
            switch result {
            case let .success(response):
                do {
                    let data =  response.data
                    let result = try JSONDecoder().decode(ApiResponseModel.self, from: data)
                    self.delegate?.didGetProductst(response: result)
                } catch {
                    print("error")
                }
            case let .failure(error):
                self.delegate?.didGetProductsWithError(error: error.localizedDescription)
                print("failure: \(error)")
            }
        }
    }
}
