//
//  Copyright (c) 2016 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import Firebase
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        initializePerformanceMetrics()
        initializeGoogleAnalyticsManually()
    
        return true
    }
    
    
    //Firebase init
    
    //defualt app
    func initializeGoogleAnalytics() {
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-2", ofType: "plist")
        guard let fileopts = FirebaseOptions(contentsOfFile: filePath!)
            else { assert(false, "Couldn't load config file") }
        FirebaseApp.configure(options: fileopts)
        
    }
    
    //secondary app
    func initializePerformanceMetrics() {
        let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
        guard let fileopts = FirebaseOptions(contentsOfFile: filePath!)
          else { assert(false, "Couldn't load config file") }
        FirebaseApp.configure(name: "performance", options: fileopts)
    }

    func initializePerformanceMetricsBoo() {
        let fbAppId = "1:803146229088:ios:030e17290044f4f9672a05"
        let firebaseSenderID = "803146229088"
        let options = FirebaseOptions(googleAppID: fbAppId, gcmSenderID: firebaseSenderID)
        options.projectID = "performance-demo-app"
        options.bundleID = "com.servicenow.agentdemo"
        options.apiKey = "AIzaSyAbcBgQMoAGnnHF0DkkITRILVF5W9mrEc4"
        FirebaseApp.configure(name: "performance", options: options)
    }
    
    func initializeGoogleAnalyticsManually() {
        let appId = "1:803146229088:ios:2cb98a4cf53e3c08672a05"
        let gcmSenderId = "803146229088"
        let options = FirebaseOptions(googleAppID: appId, gcmSenderID: gcmSenderId)
        options.googleAppID = "1:803146229088:ios:2cb98a4cf53e3c08672a05"
        options.projectID = "performance-demo-app"
        options.bundleID = "com.servicenow.agentdemo"
        options.apiKey = "AIzaSyAbcBgQMoAGnnHF0DkkITRILVF5W9mrEc4"
        options.clientID = "803146229088-cs8vv4924ts5t10gr49p0t4t3d4dkh1t.apps.googleusercontent.com"
        FirebaseApp.configure(options: options)
    }
}
