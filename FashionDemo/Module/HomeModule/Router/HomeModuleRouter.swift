//
//  HomeModuleRouter.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import UIKit

/// Defines the router functionalities
protocol HomeModuleRouterProtocol {
    func navigateTo(_ route: HomeModuleRouter.HomeModuleRoute)
}

class HomeModuleRouter: HomeModuleRouterProtocol {
    enum HomeModuleRoute {
        case productsList(data: HomeResponseModel)
        case details(product: Product)
    }

    typealias DataType = HomeModuleViewData
    
    weak var viewController: UIViewController?
    
    static func createModule(data: HomeModuleViewData?) -> UIViewController {
        let viewController = HomeModuleViewController()
        let remoteService = HomeServices()
        
        let remoteWorker = HomeModuleRemoteWorker(serviceName: remoteService)
        remoteService.delegate = remoteWorker
        
        let interactor = HomeModuleInteractor(remoteWorker: remoteWorker)
        remoteWorker.interactor = interactor
        
        let router = HomeModuleRouter()
        router.viewController = viewController
        let presenter = HomeModulePresenter(interactor: interactor, view: viewController, router: router)
        
        interactor.presenter = presenter
        viewController.presenter = presenter
        presenter.viewData = data
        return viewController
    }
    func navigateTo(_ route: HomeModuleRoute) {
        switch route {
        case .productsList(let data):
            navigateToProductsList(data: data)
        case .details(let product):
            navigateToProductsDetails(data: product)
        }
    }
    
    private func navigateToProductsList(data: HomeResponseModel) {
        let viewData = SelectedProductsViewData(products: data)
        let viewController = SelectedProductsRouter.createModule(data: viewData)
        //self.viewController?.navigationController?.present(viewController, animated: false)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func navigateToProductsDetails(data: Product) {
        let viewData = ProductDetailsViewData(product: data)
        let viewController = ProductDetailsRouter.createModule(data: viewData)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
