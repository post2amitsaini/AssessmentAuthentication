//
//  SigninView.swift
//  Assessment
//
//  Created by Amit Saini on 24/08/23.
//

import SwiftUI


public struct SigninView: View {
//    @State private var email = ""
//    @State private var password = ""
    @StateObject private var viewModel = SigninViewModel()
    @State private var signInSuccess = false
    @State private var isSignUpActive = false
    
    public init() { }
    
    public var body: some View {
        ZStack {
            Color.black
            NavigationLink(
                destination: MovieListView(),
                isActive: $signInSuccess, // Navigate when isLoggedIn becomes true
                label: { EmptyView() }
                            )
            NavigationLink(destination: SignUpView(),
                           isActive: $isSignUpActive,
                           label: { EmptyView()})
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
                    //Login
                    Task {
                        do {
                            try await viewModel.signIn()
                            // Sign-in was successful
                            signInSuccess = true
                        } catch {
                            // Handle the sign-in error here
                            signInSuccess = false
                            print("Sign-in error: \(error.localizedDescription)")
                        }
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
                }
                .padding(.top)
                .offset(y: 110)
                
                Button {
                    //Sign UP
                    isSignUpActive = true
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

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}


