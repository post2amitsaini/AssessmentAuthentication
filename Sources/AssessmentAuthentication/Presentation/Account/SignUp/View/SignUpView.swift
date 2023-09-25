//
//  SwiftUIView.swift
//  
//
//  Created by Amit Saini on 04/09/23.
//

import SwiftUI

public struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    public var onSuccessfulSignUp: (() -> Void)?
    
    public init(onSuccessfulSignUp: (() -> Void)? = nil) {
        self.onSuccessfulSignUp = onSuccessfulSignUp
    }
    
    public var body: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20) {
                Text("SignUp")
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
                    //SignUp
                    Task {
                        await viewModel.signUp()
                        onSuccessfulSignUp?()
                    }
                } label: {
                    Text("SignUp")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottomTrailing))
                        )
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

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
