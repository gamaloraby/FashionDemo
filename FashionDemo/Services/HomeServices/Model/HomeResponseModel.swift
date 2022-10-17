//
//  HomeResponseModel.swift
//  FashionDemo
//
//  Created by gamal oraby on 15/10/2022.
//

import Foundation


struct Product: Codable {
    let barcode, welcomeDescription, id: String
    let imageURL: String
    let name: String
    let retailPrice: Int
    let costPrice: Int?

    enum CodingKeys: String, CodingKey {
        case barcode
        case welcomeDescription = "description"
        case id
        case imageURL = "image_url"
        case name
        case retailPrice = "retail_price"
        case costPrice = "cost_price"
    }
}

typealias HomeResponseModel = [Product]
typealias ApiResponseModel = [String: Product]
