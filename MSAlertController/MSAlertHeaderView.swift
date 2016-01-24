//
//  MSAlertHeaderView.swift
//  MSAlertController
//
//  Created by 鈴木大貴 on 2016/01/23.
//  Copyright (c) 2016年 Taiki Suzuki. All rights reserved.
//

import UIKit
import MisterFusion

public class MSAlertHeaderView: UIView {
    
    public let titleLabel = UILabel()
    public let messageLabel = UILabel()
    public let textFieldContentView = UIView()
    
    public var superviewTitleConstraint: NSLayoutConstraint?
    public var titleHeightConstraint: NSLayoutConstraint?
    public var titleMessageConstraint: NSLayoutConstraint?
    public var messageHeightConstraint: NSLayoutConstraint?
    
    public var messageTextFieldConstraint: NSLayoutConstraint?
    public var textFieldHeightConstraint: NSLayoutConstraint?
    public var textFieldSuperviewConstraint: NSLayoutConstraint?
    
    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 270, height: 104))
        setupViews()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        titleLabel.text = "MSAlertContorller"
        titleLabel.font = .boldSystemFontOfSize(16)
        titleLabel.textAlignment = .Center
        titleLabel.numberOfLines = 0
        let titleLabelConstraints = addLayoutSubview(titleLabel, andConstraints:
            titleLabel.Top |+| 22,
            titleLabel.Right |-| 18,
            titleLabel.Left |+| 18,
            titleLabel.Height |=| 16
        )
        superviewTitleConstraint = titleLabelConstraints.firstAttribute(.Top).first
        titleHeightConstraint = titleLabelConstraints.firstAttribute(.Height).first
        
        
        messageLabel.text = "This is MSAlertController."
        messageLabel.font = .boldSystemFontOfSize(14)
        messageLabel.textAlignment = .Center
        messageLabel.numberOfLines = 0
        let messageLabelConstraints = addLayoutSubview(messageLabel, andConstraints:
            messageLabel.Top |==| titleLabel.Bottom |+| 8,
            messageLabel.Left |+| 18,
            messageLabel.Right |-| 18,
            messageLabel.Height |=| 8
        )
        titleMessageConstraint = messageLabelConstraints.firstAttribute(.Top).first
        messageHeightConstraint = messageLabelConstraints.firstAttribute(.Height).first
        
        
        let textFieldContentViewConstraints = addLayoutSubview(textFieldContentView, andConstraints:
            textFieldContentView.Top |==| messageLabel.Bottom |+| 18,
            textFieldContentView.Right |-| 18,
            textFieldContentView.Left |+| 18,
            textFieldContentView.Height |=| 14,
            self.Bottom |==| textFieldContentView.Bottom |+| 18
        )
        messageTextFieldConstraint = textFieldContentViewConstraints.firstAttribute(.Top).first
        textFieldHeightConstraint = textFieldContentViewConstraints.firstAttribute(.Height).first
        textFieldSuperviewConstraint = textFieldContentViewConstraints.firstItem(self).firstAttribute(.Bottom).first
        
        layoutIfNeeded()
    }
}