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

@objc(FXPopupController)
@objcMembers
open class PopupController: UIViewController, PopupControllerProtocol {
    
    public let customView: UIView & PopupViewProtocol
    
    public init(_ customView: UIView & PopupViewProtocol) {
        self.customView = customView
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
        NSLayoutConstraint.activate([
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            customView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor),
        ])
        
    }
    
    public func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
