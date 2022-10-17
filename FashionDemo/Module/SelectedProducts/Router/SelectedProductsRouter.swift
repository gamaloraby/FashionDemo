//
//  SelectedProductsRouter.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import UIKit

/// Defines the router functionalities
protocol SelectedProductsRouterProtocol {
    func navigateTo(_ route: SelectedProductsRouter.SelectedProductsRoute)
}

class SelectedProductsRouter: SelectedProductsRouterProtocol {
    enum SelectedProductsRoute {
        //case
    }

    typealias DataType = SelectedProductsViewData
    
    weak var viewController: UIViewController?
    
    static func createModule(data: SelectedProductsViewData?) -> UIViewController {
        let viewController = SelectedProductsViewController()
        let router = SelectedProductsRouter()
        router.viewController = viewController
        let presenter = SelectedProductsPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        presenter.viewData = data
        return viewController
    }
    
    func navigateTo(_ route: SelectedProductsRoute) {
//        switch route {
//
//        }
    }
}
