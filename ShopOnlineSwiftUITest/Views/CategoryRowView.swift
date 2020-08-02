//
//  CategoryRowView.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 01/08/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import SwiftUI

struct CategoryRowView: View {
    var category: Category

    var body: some View {
        HStack (alignment: .bottom) {
            Text(category.title)
            Spacer()
            Image(systemName: "arrow.right")
        }
    .padding(10)
    }
}

#if DEBUG
struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(category: Category())
    }
}
#endif
