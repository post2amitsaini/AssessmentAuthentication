//
//  AuthenticationData.swift
//  
//
//  Created by Amit Saini on 24/09/23.
//

import SwiftUI
import Combine

public class AuthenticationData: ObservableObject {
    @Published public var signUPValue: Bool = false
    
    public init() {}
}
