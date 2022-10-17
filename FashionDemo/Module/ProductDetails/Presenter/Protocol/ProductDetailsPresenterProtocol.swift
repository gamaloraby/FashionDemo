//
//  ProductDetailsPresenterProtocol.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

protocol ProductDetailsPresenterProtocol: AnyObject {
    var interactor: ProductDetailsInteractorProtocol? { get set }
    var view: ProductDetailsPresenterOutputProtocol? { get set }
    var router: ProductDetailsRouterProtocol? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
}

protocol ProductDetailsPresenterOutputProtocol: AnyObject {
    func updateViewData(data: Product)
}
