//
//  TextModifiers.swift
//  PackPim
//
//  Created by Kasper Kloster on 08/10/2024.
//

import SwiftUI

func customHeadLineText(_ text: String) -> some View {
    Text(text)
        .font(.system(size: 24, weight: .bold))
        .padding([.leading, .top])
        .frame(maxWidth: .infinity, alignment: .leading)
}
