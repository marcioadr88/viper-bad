//
//  AlertUtils.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-16.
//

import UIKit

/// Utility to construct Alerts
class AlertUtils {
    
    /// Build a simple alert with title, message and Ok Action
    static func buildAlertController(title: String, message: String,
                                     handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(action)
        
        return alertController
    }
}
