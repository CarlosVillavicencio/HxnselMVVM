//
//  BaseNavigationController.swift
//  HxnselMVVM
//
//  Created by Carlos V on 18/02/23.
//

import Foundation
import UIKit

open class BaseNavigationController: UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor = .green
//        self.navigationBar.barTintColor = .white
        self.navigationBar.prefersLargeTitles = false
//        if #available(iOS 15.0, *) {
//            let navigationBarAppearance = UINavigationBarAppearance()
//            navigationBarAppearance.configureWithOpaqueBackground()
//
//            self.navigationBar.backgroundColor = .white
//
//            self.navigationItem.scrollEdgeAppearance = navigationBarAppearance
//            self.navigationItem.standardAppearance = navigationBarAppearance
//            self.navigationItem.compactAppearance = navigationBarAppearance
//
//            self.setNeedsStatusBarAppearanceUpdate()
//
//
//        }
        if #available(iOS 15.0, *) {
//            let navigationBarAppearance = UINavigationBarAppearance()
//            navigationBarAppearance.configureWithOpaqueBackground()
//            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
//            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
//            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        } else if #available(iOS 13.0, *) {
            self.navigationBar.barTintColor = .white
        }
        self.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.layoutIfNeeded()

    }
}
