//
//  CustomIntrinsicContentSizeView.swift
//  FXViewKit
//
//  Created by Mr.wu on 2020/2/19.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import UIKit

public class CustomIntrinsicContentSizeView: UIView {

    override public var intrinsicContentSize: CGSize {
        return frame.size
    }

}
