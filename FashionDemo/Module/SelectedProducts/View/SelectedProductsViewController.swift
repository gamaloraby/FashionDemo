//
//  SelectedProductsViewController.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import UIKit

class SelectedProductsViewController: UIViewController {
    @IBOutlet weak var productsList: UITableView!
    var presenter: SelectedProductsPresenterProtocol?
    // MARK: - Init
    init() {
        super.init(nibName: "\(SelectedProductsViewController.self)", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DeInit
    deinit {
         debugPrint("\(SelectedProductsViewController.self)" + "Release from Memory")
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
        setupTableView()
    }
    
    private func setupTableView() {
        productsList.register(UINib(nibName: "ProductToSelectCell", bundle: nil), forCellReuseIdentifier: "productToSelectCell")
        productsList.delegate = self
        productsList.dataSource = self
    }
}

extension SelectedProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getProductsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productToSelectCell", for: indexPath) as? ProductToSelectCell else {
            fatalError()
        }
        let data = presenter?.getProduct(row: indexPath.row)
        cell.config(image: data?.imageURL ?? "", name: data?.name ?? "", index: indexPath.row)
        cell.delegate = self
        return  cell
    }
}

extension SelectedProductsViewController: CellDelegate {
    func didAddClicked(index: Int) {
        presenter?.addProduct(index: index)
    }
}
extension SelectedProductsViewController: SelectedProductsPresenterOutputProtocol {
    func didProdctAdded() {
        let alert = UIAlertController(title: "", message: "Item added. add anothe one", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
