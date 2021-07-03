//
//  PopupView.swift
//  HTComponents
//
//  Created by mac on 2021/6/10.
//

import UIKit

@objc(HTPopupView)
@objcMembers
open class PopupView: UIView, PopupViewProtocol {
    
    public weak var popupControllerDelegate: PopupControllerProtocol?

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
