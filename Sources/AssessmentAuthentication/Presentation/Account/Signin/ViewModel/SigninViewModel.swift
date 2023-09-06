//
//  SigninViewModel.swift
//  Assessment
//
//  Created by Amit Saini on 24/08/23.
//

import Foundation
import Firebase
import FirebaseAuth

class SigninViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var signInError: String? = nil
    
    init() {
        if let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist") {
            print(path)
            if let firebaseOptions = FirebaseOptions(contentsOfFile: path) {
                FirebaseApp.configure(options: firebaseOptions)
            }
        }
        //FirebaseApp.configure()GoogleService-Info
        /*
         if let plistPath = Bundle.module.path(forResource: "MyData", ofType: "plist"),
            let plistData = FileManager.default.contents(atPath: plistPath) {
             do {
                 let plist = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil)
                 if let plistDictionary = plist as? [String: Any] {
                     // Now you can work with the plist data.
                 }
             } catch {
                 print("Error loading plist: \(error)")
             }
         }

         */
    }
    
    func signIn(completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Handle sign-in error
                self.signInError = error.localizedDescription
                completion(false)
            } else {
                // User successfully signed in
                // You can add additional logic here, such as navigating to another view
                print("User signed in successfully")
                completion(true)
            }
        }
    }
}


