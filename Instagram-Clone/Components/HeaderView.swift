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
            Text(TEXT_SIGNIN_HEADLINE)
                .font(Font.title)
                .padding(.bottom)
            Text(TEXT_SIGNIN_SUBHEADLINE)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(TextAlignment
                    .center)
        }
    }
}
