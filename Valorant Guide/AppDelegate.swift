//
//  AppDelegate.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 13/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var coreDataStack: CoreDataStack = .init(modelName: "Favorites")
    
    static let sharedAppDelegate: AppDelegate = {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unexpected app delegate type, did it change? \(String(describing: UIApplication.shared.delegate))")
        }
        return delegate
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Register all transformers for Core Data
//        ColorTransformer.register()
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

// MARK: - Private Methods

extension AppDelegate {
    private func setupNavigationBackButton() {
        let backButtonBackgroundImage = UIImage(named: "Arrow")!.withRenderingMode(.alwaysOriginal)
        let barAppearance = UINavigationBar.appearance()
        barAppearance.backIndicatorImage = backButtonBackgroundImage
        barAppearance.backIndicatorImage?.withTintColor(.black)
        barAppearance.backIndicatorTransitionMaskImage = backButtonBackgroundImage
    }
}
