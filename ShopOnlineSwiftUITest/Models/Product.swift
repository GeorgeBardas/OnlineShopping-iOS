//
//  Product.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 12/07/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Product : Identifiable, Codable, Hashable {
    let id = UUID()
    var title: String = "Test"
    var description: String =  "Lorem ipsum short desc"
    var price: Float = 0
}

// MARK: Test Data
extension Product {
    static func testData() -> [Product] {
        return [
            Product(),
            Product(),
            Product(),
            Product(),
            Product()
        ]
    }
}

class ProductApi {
    func getProducts(completionHandler: @escaping ([Product]) -> ()) {
        guard let url = URL(string: "http://localhost:8080/products") else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, _) in
            DispatchQueue.main.async {
                if urlResponse != nil && (urlResponse as? HTTPURLResponse)?.statusCode == 200 {
                    if data != nil {
                        let posts = try! JSONDecoder().decode([Product].self, from: data!)
                        completionHandler(posts)
                    } else {
                        
                    }
                } else {
//                    completionHandler(nil)
                }
            }
        }.resume()
    }
}
