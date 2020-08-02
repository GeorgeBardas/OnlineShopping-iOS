//
//  Category.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 01/08/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Category : Identifiable, Codable {
    let id = UUID()
    var title: String = "Test category"
}

// MARK: Test Data
extension Product {
    static func testData() -> [Category] {
        return [
            Category(),
            Category(),
            Category(),
            Category(),
            Category()
        ]
    }
}

class CategoryApi {
    func getCategories(completionHandler: @escaping ([Category]) -> ()) {
        guard let url = URL(string: "http://localhost:8080/categories") else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, _) in
            DispatchQueue.main.async {
                if urlResponse != nil && (urlResponse as? HTTPURLResponse)?.statusCode == 200 {
                    if data != nil {
                        let categories = try! JSONDecoder().decode([Category].self, from: data!)
                        completionHandler(categories)
                    } else {
                        
                    }
                } else {
//                    completionHandler(nil)
                }
            }
        }.resume()
    }
}
