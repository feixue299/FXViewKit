//
//  PopupController.swift
//  FXViewKit
//
//  Created by mac on 2021/6/10.
//

import UIKit

@objc(FXPopupViewProtocol)
public protocol PopupViewProtocol: NSObjectProtocol {
    weak var popupControllerDelegate: PopupControllerProtocol? { set get }
}

@objc(FXPopupControllerProtocol)
public protocol PopupControllerProtocol: NSObjectProtocol {
    func dismiss()
}

@objc(FXPopupViewContentMode)
public enum PopupViewContentMode: Int {
    case `default` = 0 // default is full
    case custom
    case full
}

@objc(FXPopupController)
@objcMembers
open class PopupController: UIViewController, PopupControllerProtocol {
    
    public let customView: UIView & PopupViewProtocol
    public let contentMode: PopupViewContentMode
    
    public init(_ customView: UIView & PopupViewProtocol, contentMode: PopupViewContentMode = .default) {
        self.customView = customView
        self.contentMode = contentMode
        super.init(nibName: nil, bundle: nil)
        self.customView.popupControllerDelegate = self
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.customView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self.customView)
        
        var constraints = [
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        switch contentMode {
        case .default,
             .full:
            constraints += [
                customView.widthAnchor.constraint(equalTo: view.widthAnchor),
                customView.heightAnchor.constraint(equalTo: view.heightAnchor),
            ]
        case .custom:
            constraints += [
                customView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
                customView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor),
            ]
        }
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    public func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
