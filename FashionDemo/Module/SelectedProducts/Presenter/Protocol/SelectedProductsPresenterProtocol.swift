//
//  SelectedProductsPresenterProtocol.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

/// Defines the presenter capabilities
protocol SelectedProductsPresenterProtocol: AnyObject {
    var interactor: SelectedProductsInteractorProtocol? { get set }
    var view: SelectedProductsPresenterOutputProtocol? { get set }
    var router: SelectedProductsRouterProtocol? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    
    func getProductsCount() -> Int
    func getProduct(row: Int) -> Product?
    func addProduct(index: Int)
}

/// Defines the presenter callbacks to view
protocol SelectedProductsPresenterOutputProtocol: AnyObject {
    
}
