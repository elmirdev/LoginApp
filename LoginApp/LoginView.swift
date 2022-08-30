//
//  LoginView.swift
//  LoginApp
//
//  Created by ELMIR ISMAYILZADA on 30.08.22.
//

import SwiftUI

struct LoginView: View {
    
    @State var tfTapped = false
    @State var sfTapped = false
    @State var loginText = "LOGIN"
    @State var buttonWidth = UIScreen.main.bounds.width - 64
    @State var buttonHeight: CGFloat = 48
    @State var screenWidth = UIScreen.main.bounds.width
    @State var screenHeight = UIScreen.main.bounds.height
    @State var buttonAnimateStep1 = false
    @State var buttonAnimateStep2 = false
    @State var buttonAnimateStep3 = false
    @State var buttonAnimateStep4 = false
    
    @State var isTimerRunning = false
    @State var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                if buttonAnimateStep3 == false {
                    Image("user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .padding(.bottom)
                    
                    VStack {
                        Text("Welcome back!")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("customPurple"))
                        
                        Text("Sign in to your account")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    
                    VStack(alignment: .trailing, spacing: 16) {
                        CustomTextField(isSecure: false, onTapped: $tfTapped)
                            .onTapGesture {
                                tfTapped = true
                                sfTapped = false
                            }
                        
                        CustomTextField(isSecure: true, onTapped: $sfTapped)
                            .onTapGesture {
                                tfTapped = false
                                sfTapped = true
                            }
                        
                        Button(action: {}) {
                            Text("Forgot password?")
                                .font(.callout)
                                .foregroundColor(Color("customPurple"))
                        }
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 32)
                }
                
                
                VStack(spacing: 24) {
                    if  buttonAnimateStep4 == false {
                        Button(action: {
                            withAnimation {
                                buttonAnimateStep1.toggle()
                                isTimerRunning.toggle()
                            }
                        }) {
                            ZStack {
                                Text(buttonAnimateStep1 ? "" : loginText)
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .frame(width: buttonAnimateStep1 ? 48 : buttonWidth, height: buttonAnimateStep1 ? 48 : buttonHeight)
                                    .background(Color("customPurple"))
                                    .cornerRadius(buttonAnimateStep1 ? 24 : 20)
                                
                                if buttonAnimateStep1 {
                                    Rectangle()
                                        .fill(.white)
                                        .frame(width: 3, height: 16)
                                        .offset(y: -7)
                                        .rotationEffect(Angle(degrees: buttonAnimateStep2 ? 1440 : 0))
                                    
                                    Rectangle()
                                        .fill(.white)
                                        .frame(width: 12, height: 3)
                                        .offset(x: 4.5)
                                        .rotationEffect(Angle(degrees: buttonAnimateStep2 ? 720 : 0))
                                }
                            }
                        }
                        .animation(.linear(duration: 3), value: buttonAnimateStep2)
                        .onReceive(timer) { _ in
                            if isTimerRunning {
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                }
                                if timeRemaining == 9 {
                                    withAnimation {
                                        buttonAnimateStep2.toggle()
                                    }
                                }
                                if timeRemaining == 6 {
                                    withAnimation {
                                        loginText = ""
                                        buttonWidth = screenWidth
                                        buttonHeight = screenHeight
                                        buttonAnimateStep3.toggle()
                                        buttonAnimateStep1.toggle()
                                    }
                                }
                                if timeRemaining == 5 {
                                    withAnimation {
                                        buttonAnimateStep4.toggle()
                                    }
                                }
                                if timeRemaining == 5 {
                                    timer.upstream.connect().cancel()
                                }
                                print(timeRemaining)
                                print(buttonAnimateStep2)
                            }
                        }
                    }
                    
                    if buttonAnimateStep3 == false {
                        Button(action: {}) {
                            Text("Create Account")
                                .font(.callout)
                                .foregroundColor(Color("customPurple"))
                        }
                    }
                }
                .ignoresSafeArea()
                
                Spacer()
            }
            if buttonAnimateStep4 {
                SuccessView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(tfTapped: true)
    }
}
