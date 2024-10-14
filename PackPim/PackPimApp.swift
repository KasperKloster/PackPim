//
//  PackPimApp.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import SwiftUI
import FirebaseCore


//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//    return true
//  }
//}


@main
struct PackPimApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//     Initialise Firebase
    init () {
        FirebaseApp.configure()
//        FirebaseConfiguration.shared.setLoggerLevel(.debug)
        print("Firebase connect")        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



