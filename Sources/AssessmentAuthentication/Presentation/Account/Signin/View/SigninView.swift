//
//  SigninView.swift
//  Assessment
//
//  Created by Amit Saini on 24/08/23.
//

import SwiftUI


public struct SigninView: View {
    
    @StateObject var viewModel = SigninViewModel()
    public var onSignUpTapped: (() -> Void)?
    public var onSuccessfulLogin: (() -> Void)?
    
    public init(onSignUpTapped: (() -> Void)? = nil, onSuccessfulLogin: (() -> Void)? = nil) {
        self.onSignUpTapped = onSignUpTapped
        self.onSuccessfulLogin = onSuccessfulLogin
    }
    
    public var body: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                TextField("Email" , text: $viewModel.email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .keyboardType(.emailAddress)
                    .placeholder(when: viewModel.email.isEmpty)  {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $viewModel.password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: viewModel.password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button {
                    // Login
                    Task {
                        await viewModel.signIn()
                        onSuccessfulLogin?()
                    }
                } label: {
                    Text("SignIn")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                        .disabled(!viewModel.isSignInButtonEnabled)
                }
                .padding(.top)
                .offset(y: 110)
                
                Button {
                    //Sign UP
                    onSignUpTapped?()
                } label: {
                    Text("Do not have an account? SignUp")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
                
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}



