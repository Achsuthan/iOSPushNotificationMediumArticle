//
//  AppDelegate.swift
//  iOSPushNotificationSetup
//
//  Created by achsum on 19/6/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.registerForNotification()
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func registerForNotification() {
        let userNotificationCentre = UNUserNotificationCenter.current()
        userNotificationCentre.requestAuthorization(options: [.alert, .sound]) { (granted, error) in

            guard error == nil else {

                // This should be done with main thread
                DispatchQueue.main.async {
                    // If requried we can do some action here
                }
                return
            }
            
            // This should be done with main thread
            DispatchQueue.main.async {
                // We are requesting to do the register notification
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Here the device token will be received, once notification registration got successful
        // We can send to our own backend or we can pass this data to the push notificaiton services(Firebase, OneSignal, etc), this configurations is based on the push notification serivice providers.
        print("Device Token \(deviceToken.map { String(format: "%02.2hhx", $0) }.joined())")
    }
}
