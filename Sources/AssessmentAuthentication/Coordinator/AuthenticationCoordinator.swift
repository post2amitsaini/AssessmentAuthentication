//
//  AuthenticationCoordinator.swift
//  
//
//  Created by Amit Saini on 22/09/23.
//

//import SwiftUI
//
//public enum AuthenticationScreens: String, Identifiable {
//    case SignIn, SignUp
//    
//    public var id: String {
//        self.rawValue
//    }
//}
//
////public protocol AuthenticationCoordinatorProtocol {
////    func view(for page: AuthenticationScreens) -> AnyView
////}
//public protocol AuthenticationCoordinatorProtocol {
//    associatedtype CoordinatorType: ObservableObject
//    func view(for page: AuthenticationScreens) -> AnyView
//    func getCoordinator() -> CoordinatorType
//}
//
////public class AuthenticationCoordinator: AuthenticationCoordinatorProtocol {
////    public func view(for page: AuthenticationScreens) -> AnyView {
////        switch page {
////        case .SignIn:
////            return AnyView(SigninView())
////        case .SignUp:
////            return AnyView(SignUpView())
////        }
////    }
////}
//public class AuthenticationCoordinator: AuthenticationCoordinatorProtocol {
//    public typealias CoordinatorType = Coordinator
//
//    public func view(for page: AuthenticationScreens) -> AnyView {
//        switch page {
//        case .SignIn:
//            return AnyView(SigninView<Coordinator>())
//        case .SignUp:
//            return AnyView(SignUpView<Coordinator>())
//        }
//    }
//
//    public func getCoordinator() -> Coordinator {
//        return Coordinator(authenticationCoordinator: self)
//    }
//}
