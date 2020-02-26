//
//  TextFieldBinder.swift
//  FXViewKit
//
//  Created by Mr.wu on 2020/2/25.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import UIKit

public class TextFieldBinder: NSObject, UITextFieldDelegate {
    
    private let bindTo: ((String?) -> Void)?
    private let didEndEditing: ((String?) -> Void)?
    
    public init(bindTo:((String?) -> Void)? = nil,
                didEndEditing:((String?) -> Void)? = nil) {
        self.bindTo = bindTo
        self.didEndEditing = didEndEditing
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        bindTo?(text)
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditing?(textField.text)
    }

}
