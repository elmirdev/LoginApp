//
//  CustomTextField.swift
//  LoginApp
//
//  Created by ELMIR ISMAYILZADA on 30.08.22.
//

import SwiftUI

struct CustomTextField: View {
    
    let isSecure: Bool
    @Binding var onTapped: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .frame(width: UIScreen.main.bounds.width - 64, height: 56)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(onTapped ? .green : .gray, lineWidth: 0.5)
                
                if isSecure {
                    SecureField("Password", text: .constant(""))
                        .padding()
                } else {
                    TextField("Email", text: .constant(""))
                        .padding()
                }
            }

    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(isSecure: false, onTapped: .constant(false))
    }
}
