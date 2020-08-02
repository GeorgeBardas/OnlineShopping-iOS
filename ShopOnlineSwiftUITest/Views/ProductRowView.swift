//
//  ProductRowView.swift
//  ShopOnlineSwiftUITest
//
//  Created by George Bardas on 12/07/2020.
//  Copyright © 2020 George Bardas. All rights reserved.
//

import SwiftUI

struct ProductRowView: View {
    var product: Product

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                RemoteImage(url: URL(string: "https://deichmann.scene7.com/asset/deichmann/US_01_705782_00?$rr_pdp_zoom$&defaultImage=default_obs")!)
                    .frame(width: 150, height: 150)
                Text(product.title)
                Text(product.description)
                    .font(.system(size: 12))
            }
            Spacer()
        }
    }
}

#if DEBUG
struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: Product())
//        Group {
//            LandmarkRow(landmark: landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
