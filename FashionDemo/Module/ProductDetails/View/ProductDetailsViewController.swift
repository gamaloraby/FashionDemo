//
//  ProductDetailsViewController.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    var presenter: ProductDetailsPresenterProtocol?
    
    init() {
        super.init(nibName: "\(ProductDetailsViewController.self)", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
         debugPrint("\(ProductDetailsViewController.self)" + "Release from Memory")
    }
    
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
       
    }
    
}

extension ProductDetailsViewController: ProductDetailsPresenterOutputProtocol {
    func updateViewData(data: Product) {
        self.name.text = data.name
        self.productDescription.text = data.welcomeDescription
        guard let url = URL(string: data.imageURL) else {return}
        image.load(url: url)
    }
}
