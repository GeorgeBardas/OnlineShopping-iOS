//
//  PageView.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 13/07/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    
    @State var currentPage = 1

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        Text("da")
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
