//
//  AppDelegate.swift
//  I-HelperEmployee
//
//  Created by Maxtra Technologies P LTD on 18/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import UIKit
import SideMenuController
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ///
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "menu")
        SideMenuController.preferences.drawing.sidePanelPosition = .overCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 280
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .showUnderlay
       
        
        UINavigationBar.appearance().barTintColor = CommonHelper.mainColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        CoreDataStack.sharedInstance.applicationDocumentsDirectory()
        configureRootViewController()
        
        GMSServices.provideAPIKey("AIzaSyAzb08qDRp2wCsXRQecVG63m4sQn_2VHpI")
        
        GMSPlacesClient.provideAPIKey("AIzaSyAzb08qDRp2wCsXRQecVG63m4sQn_2VHpI")
        return true
    }

    func configureRootViewController() {
        
        let newWindow = UIWindow(frame: UIScreen.main.bounds)
        
        if UserDefaults.standard.bool(forKey: "isNotFirstTime_ihelperEmp") {
            newWindow.rootViewController = UIStoryboard(name: Screens.SideMenu.name(), bundle: nil).instantiateInitialViewController()
        }
        else{
            guard let viewController = UIStoryboard(name: Screens.Welcome.name(), bundle: nil).instantiateInitialViewController() as? WelcomeViewController
                else{
                    return
            }
            viewController.delegate = self
            newWindow.rootViewController = viewController
        }
        newWindow.makeKeyAndVisible()
        newWindow.alpha = 0.0
        
        UIView.animate(withDuration: 0.33, animations: {
            newWindow.alpha = 1.0
            
        }, completion: { _ in
            self.window = newWindow
        })
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStack.sharedInstance.saveContext()
    }


}



// MARK: - WelcomeViewControllerDelegate
extension AppDelegate: WelcomeViewControllerDelegate {
    
    public func welcomeViewControllerDonePressed(_ controller: WelcomeViewController) {
        
        //SetUpSideMenuController()
        UserDefaults.standard.set(false, forKey: "isNotFirstTime_ihelperEmp")
        configureRootViewController()
    }
    
    
}

