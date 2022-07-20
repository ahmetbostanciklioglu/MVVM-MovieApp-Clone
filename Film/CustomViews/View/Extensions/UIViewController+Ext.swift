//
//  UIViewController+Ext.swift
//  Film
//
//  Created by Ahmet Bostancıklıoğlu on 19.07.2022.
//

import Foundation
import UIKit
import  NVActivityIndicatorView


extension UIViewController {
    func makeDarkModeAllView() {
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = .dark
        }
        
     
    }
    
//    func getSafeAreaTop() -> CGFloat {
//
//        let keyWindow = UIApplication.shared.connectedScenes
//             .filter ({ $0.activationState == .foregroundActive })
//             .map({$0 as? UIWindowScene })
//             .compactMap({ $0 })
//             .first?.windows
//             .filter({$0.isKeyWindow}).first
//
//         return (keyWindow?.safeAreaInsets.top)!
//
//    }
//
}
