//
//  HeaderView.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Group {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
            Text("Photo Sharing")
                .font(Font.title)
                .padding(.bottom)
            Text("The easiest way to share photos with family and friends.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(TextAlignment
                    .center)
        }
    }
}
