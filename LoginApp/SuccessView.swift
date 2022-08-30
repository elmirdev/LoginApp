//
//  SuccessView.swift
//  LoginApp
//
//  Created by ELMIR ISMAYILZADA on 30.08.22.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            
            Color("customPurple")
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                Image("user")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 3)
                    }
                
                Text("LOGIN SUCCESSFULLY")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("🎉")
                    .font(.system(size: 150))
                    .frame(width: 200, height: 200)
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
