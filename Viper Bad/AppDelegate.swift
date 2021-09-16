//
//  AppDelegate.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private(set) var breakingBadRespository: BreakingBadRepository?
    
    // MARK: - AppDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let breakingBadApiClient: BreakingBadAPIClient = BreakingBadAPIClientImpl(baseURL: "https://www.breakingbadapi.com/api")
        
        breakingBadRespository = BreakingBadNetworkRepository(apiClient: breakingBadApiClient)
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

