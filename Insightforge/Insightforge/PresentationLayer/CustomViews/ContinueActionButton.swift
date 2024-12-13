//
//  ContinueActionButton.swift
//  Insightforge
//
//  Created by Алексей Зубель on 13.12.24.
//

import SwiftUI

struct ContinueActionButton: View {
    private let buttonHeight: CGFloat
    private let title: LocalizedStringKey
    private var action: () -> Void
    private let gradient: Gradient
    private var titleColor: Color
    
    init(buttonHeight: CGFloat = 58, title: LocalizedStringKey = "Continue", titleColor: Color = .black, gradient: Gradient = Gradient(colors: [.A_25400, ._3_D_2000]), action: @escaping () -> Void) {
        self.buttonHeight = buttonHeight
        self.title = title
        self.titleColor = titleColor
        self.action = action
        self.gradient = gradient
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(title)
                    .font(.callout)
                    .foregroundStyle(titleColor)
            }
            .frame(maxWidth: .infinity)
            .frame(height: buttonHeight)
            .background( LinearGradient(
                gradient: gradient,
                startPoint: .leading,
                endPoint: .trailing))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    ContinueActionButton(action: {})
}

