//
//  PopupController.swift
//  HTComponents
//
//  Created by mac on 2021/6/10.
//

import UIKit
import SnapKit

@objc(HTPopupViewProtocol)
public protocol PopupViewProtocol: NSObjectProtocol {
    weak var popupControllerDelegate: PopupControllerProtocol? { set get }
}

@objc(HTPopupControllerProtocol)
public protocol PopupControllerProtocol: NSObjectProtocol {
    func dismiss()
}

@objc(HTPopupController)
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
        
        view.addSubview(self.customView)
        self.customView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.lessThanOrEqualToSuperview()
        }
        
    }
    
    public func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
