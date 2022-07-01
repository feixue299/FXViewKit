//
//  ContentViewProtocol.swift
//  FXViewKit
//
//  Created by aria on 2022/7/2.
//

import Foundation

protocol ContentViewProtocol {
    var containerView: UIView { get }
}

extension ContentViewProtocol where Self: UIView {
    func configView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
