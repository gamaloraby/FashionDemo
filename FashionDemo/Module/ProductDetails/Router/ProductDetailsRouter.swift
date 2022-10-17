//
//  ProductDetailsRouter.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import UIKit

/// Defines the router functionalities
protocol ProductDetailsRouterProtocol {
    func navigateTo(_ route: ProductDetailsRouter.ProductDetailsRoute)
}

class ProductDetailsRouter: ProductDetailsRouterProtocol {
    enum ProductDetailsRoute {
        //case
    }

    typealias DataType = ProductDetailsViewData
    
    weak var viewController: UIViewController?
    
    static func createModule(data: ProductDetailsViewData?) -> UIViewController {
        let viewController = ProductDetailsViewController()
        let router = ProductDetailsRouter()
        router.viewController = viewController
        let presenter = ProductDetailsPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        presenter.viewData = data
        return viewController
    }
    
    func navigateTo(_ route: ProductDetailsRoute) {
//        switch route {
//
//        }
    }
}
