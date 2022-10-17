//
//
//  HomeModulePresenter.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation

class HomeModulePresenter: HomeModulePresenterProtocol {
   
    var interactor: HomeModuleInteractorProtocol?
    weak var view: HomeModulePresenterOutputProtocol?
    var router: HomeModuleRouterProtocol?
    var viewData: HomeModuleViewData?
    
    var data: HomeResponseModel?
    var storedData: [Item] = [] {
        didSet {
            if storedData.count > 0 {
                view?.showAndHideEmptyView(isShowen: false)
                view?.updateTableView(data: storedData)
            }
        }
    }
    let manager = DataManager()
    init(interactor: HomeModuleInteractorProtocol, view: HomeModulePresenterOutputProtocol, router: HomeModuleRouterProtocol) {
        self.interactor =  interactor
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        interactor?.fetchProducts()
        view?.showAndHideEmptyView(isShowen: true)
    }
    
     func viewWillAppear() {
       //
    }
    
    func viewDidAppear() {
         guard let  storedData = manager.fetchData(entityName: "Item") else {return}
         self.storedData = storedData
    }
    
    func viewWillDisappear() {
       //
    }

    func addItemToList() {
        guard let viewData = data else {return}
        router?.navigateTo(.productsList(data: viewData))
    }
    
    func clearListItems() {
        manager.clearDtat()
        view?.updateTableView(data: [])
        view?.showAndHideEmptyView(isShowen: true)
    }
    
    func openDetails(index: Int) {
        router?.navigateTo(.details(product: storedData[index]))
    }
    
    func getTotalProductsCount() -> Int {
        return  storedData.count
    }
    
    func getProduct(index: Int) -> Item? {
        return storedData[index]
    }
}

extension HomeModulePresenter: HomeModuleInteractorOutputProtocol {
    func didFetchProducts(response: ApiResponseModel) {
        let products = Array(response.values.map{ $0 })
        data = products
    }
    
    func didFetchProductsWithError(error: String) {
        print("error \(error)")
    }
}
