//
//  ProductCell.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configView(image: String, name: String) {
        productName.text = name
        guard let url = URL(string: image) else {return}
        productImage.load(url: url)
    }
    
}
