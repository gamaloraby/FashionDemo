//
//
//  ProductDetailsPresenter.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

class ProductDetailsPresenter: ProductDetailsPresenterProtocol {
    
    var interactor: ProductDetailsInteractorProtocol?
    weak var view: ProductDetailsPresenterOutputProtocol?
    var router: ProductDetailsRouterProtocol?
    var viewData: ProductDetailsViewData?
    
    init(view: ProductDetailsPresenterOutputProtocol, router: ProductDetailsRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        guard let data = viewData else {return}
        view?.updateViewData(data: data.product)
    }
    
    func viewWillAppear() {
        //
    }
    
    func viewDidAppear() {
       //
    }
    
    func viewWillDisappear() {
       //
    }
    
    
}


extension ProductDetailsPresenter: ProductDetailsInteractorOutputProtocol {
    
}
