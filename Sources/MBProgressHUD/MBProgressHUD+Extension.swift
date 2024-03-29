//
//  MBProgressHUD+Extension.swift
//  Alamofire
//
//  Created by hard on 2021/10/26.
//

import Foundation
import MBProgressHUD

public extension MBProgressHUD {
    func showText(_ text: String) {
        DispatchQueue.main.async { [self] in
            mode = .text
            label.text = text
            show(animated: true)
        }
    }
    
    func loading(_ text: String? = nil) {
        DispatchQueue.main.async { [self] in
            mode = .indeterminate
            label.text = text
            show(animated: true)
        }
    }
    
    func hideDelay() {
        DispatchQueue.main.async { [self] in
            hide(animated: true, afterDelay: 2)
        }
    }
}

public extension UIViewController {
  
  func getMBProgressHUD() -> MBProgressHUD {
    let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
    return hud
  }
  
}
