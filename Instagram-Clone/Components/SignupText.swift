//
//  SigninView.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct SignupText: View {
    var body: some View {
        HStack {
            Text(TEXT_NEED_AN_ACCOUNT)
                .font(.footnote)
                .foregroundColor(.gray)
            Text(TEXT_SIGN_UP)
                .foregroundColor(.black)
        }
    }
}
