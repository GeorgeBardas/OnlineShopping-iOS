//
//  RemoteImage.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 12/07/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import SwiftUI

struct RemoteImage: View {
    let url: URL
    let imageLoader = ImageLoader()
    @State var image: UIImage? = nil

    var body: some View {
        Group {
            makeContent()
        }
        .onReceive(imageLoader.objectWillChange, perform: { image in
            self.image = image
        })
        .onAppear(perform: {
            self.imageLoader.load(url: self.url)
        })
        .onDisappear(perform: {
            self.imageLoader.cancel()
        })
    }

    private func makeContent() -> some View {
        if let image = image {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            )
        } else {
            return AnyView(Text("😢"))
        }
    }
}
