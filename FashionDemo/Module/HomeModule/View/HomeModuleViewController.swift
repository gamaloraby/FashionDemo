//
//  HomeModuleViewController.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import UIKit

class HomeModuleViewController: UIViewController {
    
    @IBOutlet weak var productsListView: UIView!
    @IBOutlet weak var productsList: UITableView!
    @IBOutlet weak var emptyDataView: UIView!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    var presenter: HomeModulePresenterProtocol?
    //var products: [Product]?
    
    // MARK: - Init
    init() {
        super.init(nibName: "\(HomeModuleViewController.self)", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DeInit
    deinit {
         debugPrint("\(HomeModuleViewController.self)" + "Release from Memory")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    private func setupUI() {
        setupButtons()
        setupEmptyView()
    }
    
    private func setupButtons() {
        clearButton.layer.cornerRadius = 24
        addButton.layer.cornerRadius = 24
    }
    
    private func setupEmptyView() {
        emptyDataView.layer.cornerRadius = 8
    }
    
    private func setupTableView() {
        productsList.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "productCell")
        productsList.dataSource = self
        productsList.delegate = self
    }
    
    @IBAction func clearData(_ sender: Any) {
        presenter?.clearListItems()
    }
    
    @IBAction func addProduct(_ sender: Any) {
        presenter?.addItemToList()
    }
    
}

extension HomeModuleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getTotalProductsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell else {
            fatalError()
        }
        guard let data = presenter?.getProduct(index: indexPath.row) else {return cell}
        cell.configView(image: data.image ?? "", name: data.name ?? "")
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.openDetails(index: indexPath.row)
    }
}

extension HomeModuleViewController: HomeModulePresenterOutputProtocol {
    func showAndHideEmptyView(isShowen: Bool) {
        if isShowen {
            emptyDataView.isHidden = false
            productsListView.isHidden = true
        } else {
            emptyDataView.isHidden = true
            productsListView.isHidden = false
            setupTableView()
        }
    }
    
    func updateTableView(data: [Item]) {
        //self.products = data
        productsList.reloadData()
    }
}
