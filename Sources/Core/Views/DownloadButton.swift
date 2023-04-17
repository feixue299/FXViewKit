//
//  DownloadButton.swift
//  FXViewKit
//
//  Created by aria on 2023/2/19.
//

import UIKit

public class DownloadButton: UIButton {
    
    public enum DownloadButtonState {
        case pending
        case downloading
        case downloaded
    }
    
    public var downloadState: DownloadButtonState = .pending {
        didSet {
            updateState()
        }
    }
    
    public let startButton = UIButton()
    public let indicator = UIActivityIndicatorView()
    public let downloadedButton = UIButton()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        startButton.isUserInteractionEnabled = false
        indicator.isUserInteractionEnabled = false
        downloadedButton.isUserInteractionEnabled = false
        
        addSubview(startButton)
        addSubview(indicator)
        addSubview(downloadedButton)
        
        updateState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        startButton.frame = bounds
        indicator.frame = bounds
        downloadedButton.frame = bounds
    }
    
    private func updateState() {
        isEnabled = downloadState != .downloading
        startButton.isHidden = downloadState != .pending
        indicator.isHidden = downloadState != .downloading
        
        if downloadState != .downloading {
            indicator.stopAnimating()
        } else {
            indicator.startAnimating()
        }
        
        downloadedButton.isHidden = downloadState != .downloaded
    }
    
}
