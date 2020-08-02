//
//  CategoriesView.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 01/08/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {
    
//    @ObservedObject private(set) var viewModel: ViewModel
    @State var categories: [Category] = []
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
                        List (self.categories) { category in
                                    CategoryRowView(category: category)
                        }.opacity(!self.loading ? 1 : 0)
                        }.onAppear {
                            CategoryApi().getCategories {(categories) in
                                self.categories = categories
                                self.loading = false
                            }
                        }
                    ActivityIndicator(isAnimating: .constant(self.loading), style: .large)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
        .navigationBarTitle("Categories")
        }
    }
}

#if DEBUG
struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
#endif
