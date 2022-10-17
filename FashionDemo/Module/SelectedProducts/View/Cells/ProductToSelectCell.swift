//
//  ProductToSelectCell.swift
//  FashionDemo
//
//  Created by gamal oraby on 16/10/2022.
//

import UIKit

class ProductToSelectCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var index = 0
    weak var delegate: CellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
        productImage.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupButton() {
        addButton.layer.cornerRadius = addButton.frame.width / 2
    }
    
    func config(image: String, name: String, index: Int) {
        self.name.text = name
        guard let url = URL(string: image) else {return}
        self.productImage.load(url: url)
        self.index = index
    }
    @IBAction func addProduct(_ sender: Any) {
        delegate?.didAddClicked(index: self.index)
    }
}

protocol CellDelegate: AnyObject {
    func didAddClicked(index: Int)
}
