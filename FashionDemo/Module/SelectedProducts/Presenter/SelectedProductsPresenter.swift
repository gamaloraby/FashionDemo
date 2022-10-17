//
//
//  SelectedProductsPresenter.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

class SelectedProductsPresenter:  SelectedProductsPresenterProtocol {
   
    var interactor: SelectedProductsInteractorProtocol?
    weak var view: SelectedProductsPresenterOutputProtocol?
    var router: SelectedProductsRouterProtocol?
    var viewData: SelectedProductsViewData?
    
    init(view: SelectedProductsPresenterOutputProtocol, router: SelectedProductsRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
       //
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
  
    func getProductsCount() -> Int {
        return viewData?.products.count ?? 0
    }
    
    func getProduct(row: Int) -> Product? {
        guard let product =  viewData?.products[row] else { return nil}
        return product
    }
    
    func addProduct(index: Int) {
        let manager = DataManager()
        guard let data = viewData else {return}
        manager.createEntity(entityName: "Item", product: data.products[index])
    }
}

extension SelectedProductsPresenter: SelectedProductsInteractorOutputProtocol {
    
}
