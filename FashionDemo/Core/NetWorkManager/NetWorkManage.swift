//
//  NetWorkManage.swift
//  FashionDemo
//
//  Created by gamal oraby on 16/10/2022.
//

import Foundation
import Moya

enum Services {
    case getProducts
}

// MARK: - TargetType Protocol Implementation
extension Services: TargetType {
     var baseURL: URL { URL(string: "https://run.mocky.io/v3")! }
     var path: String {
        switch self {
        case .getProducts:
                return "/4e23865c-b464-4259-83a3-061aaee400ba"
        }
    }
     var method: Moya.Method {
        switch self {
        case .getProducts:
            return .get
        }
    }
     var task: Task {
        switch self {
        case .getProducts:
            return .requestPlain
        }
    }
     var sampleData: Data {
        switch self {
        case .getProducts:
            return Data()
        }
    }
     var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}
