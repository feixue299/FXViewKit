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
    case frame
}

@objc(FXPopupController)
@objcMembers
open class PopupController: UIViewController, PopupControllerProtocol {
    
    public let customView: UIView
    public let contentMode: PopupViewContentMode
    private var anchorView: UIView?
    public var dismissOnTapBackground = false
    public var backgroundColor = UIColor.black.withAlphaComponent(0.3)
    
    public init(_ customView: UIView, contentMode: PopupViewContentMode = .default) {
        self.customView = customView
        self.contentMode = contentMode
        super.init(nibName: nil, bundle: nil)
        if let cView = self.customView as? PopupViewProtocol {
            cView.popupControllerDelegate = self
        }
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    public convenience init(_ customView: UIView, anchorView: UIView) {
        self.init(customView, contentMode: .frame)
        self.anchorView = anchorView
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        self.customView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self.customView)
        
        var constraints: [NSLayoutConstraint] = []
        
        switch contentMode {
        case .default,
             .full:
            constraints += [
                customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                customView.widthAnchor.constraint(equalTo: view.widthAnchor),
                customView.heightAnchor.constraint(equalTo: view.heightAnchor),
            ]
        case .custom:
            constraints += [
                customView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
                customView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor),
                customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
        case .frame:
            if let anchorView = anchorView, let window = UIApplication.shared.fx_keyWindow() {
                let rect = anchorView.convert(anchorView.bounds, to: window)
                let trailing = window.frame.maxX - rect.maxX
                let bottom = window.frame.maxY - rect.maxY
                constraints += [
                    (trailing > rect.minX ?
                        customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: rect.minX) :
                        customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailing)),
                    (bottom > rect.minY ?
                        customView.topAnchor.constraint(equalTo: view.topAnchor, constant: rect.maxY) :
                        customView.topAnchor.constraint(equalTo: view.topAnchor, constant: rect.maxY - customView.frame.height)),
                ]
                
            } else {
                constraints += [
                    customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                ]
            }
            constraints += [
                customView.widthAnchor.constraint(equalToConstant: customView.frame.width),
                customView.heightAnchor.constraint(equalToConstant: customView.frame.height),
            ]
        }
        
        NSLayoutConstraint.activate(constraints)
        
        if dismissOnTapBackground {
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTap)))
        }
        
    }
    
    @objc private func viewTap() {
        dismiss(animated: true, completion: nil)
    }
    
    public func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}

public extension UIApplication {
    func fx_keyWindow() -> UIWindow? {
        let keyWindow: UIWindow?
        if let window = UIApplication.shared.delegate?.window?.flatMap({ $0 }) {
            keyWindow = window
        } else {
            if #available(iOS 13.0, *) {
                if let window = ((UIApplication.shared.connectedScenes.first as? UIWindowScene)?.delegate as? UIWindowSceneDelegate)?.window {
                    keyWindow = window
                } else {
                    keyWindow = UIApplication.shared.keyWindow
                }
            } else {
                keyWindow = UIApplication.shared.windows.first
            }
        }
        
        return keyWindow
    }
}
