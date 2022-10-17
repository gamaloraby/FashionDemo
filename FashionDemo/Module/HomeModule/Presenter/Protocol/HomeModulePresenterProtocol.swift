//
//  HomeModulePresenterProtocol.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

/// Defines the presenter capabilities
protocol HomeModulePresenterProtocol: AnyObject {
    var interactor: HomeModuleInteractorProtocol? { get set }
    var view: HomeModulePresenterOutputProtocol? { get set }
    var router: HomeModuleRouterProtocol? { get set }
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func addItemToList()
    func clearListItems()
    func openDetails(index: Int)
    func getTotalProductsCount() -> Int
    func getProduct(index: Int) -> Item?
}

/// Defines the presenter callbacks to view
protocol HomeModulePresenterOutputProtocol: AnyObject {
    func showAndHideEmptyView(isShowen: Bool)
    func updateTableView(data: [Item])
}
