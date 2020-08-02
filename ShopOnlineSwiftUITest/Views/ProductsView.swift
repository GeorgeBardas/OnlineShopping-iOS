//
//  ProductsView.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 12/07/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import SwiftUI

struct ProductsView: View {
    
//    @ObservedObject private(set) var viewModel: ViewModel
    @State var products: [Product] = []
    @State var loading: Bool = true

    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    List {
                        ForEach (self.products.chunks(2), id: \.self) { products in
//                            EmptyView()
//                            ProductRowView(products: prod)
                            HStack {
                                ForEach (products) { product in
                                    ProductRowView(product: product)
                                }
                            }
//                            self.Print(self.products.chunks(2))
                        }
                    }.opacity(!self.loading ? 1 : 0)
                    }.onAppear {
                        ProductApi().getProducts {(posts) in
                            self.products = posts
                            self.loading = false
                        }
                    }
                ActivityIndicator(isAnimating: .constant(self.loading), style: .large)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            .navigationBarTitle("Home")
        }
        
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

extension Array {
    func chunks(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

#if DEBUG
struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
#endif
