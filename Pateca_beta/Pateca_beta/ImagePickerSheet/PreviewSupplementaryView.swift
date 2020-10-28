//
//  PreviewSupplementaryView.swift
//  ImagePickerSheet
//
//  Created by Laurin Brandner on 06/09/14.
//  Copyright (c) 2014 Laurin Brandner. All rights reserved.
//

import UIKit

class PreviewSupplementaryView : UICollectionReusableView {
    
    private let button: UIButton = {
        let button = UIButton()
        button.tintColor = .whiteColor()
        button.isUserInteractionEnabled = false
        button.setImage(PreviewSupplementaryView.checkmarkImage, for: .Normal)
        button.setImage(PreviewSupplementaryView.selectedCheckmarkImage, for: .selected)
        
        return button
    }()
    
    var buttonInset = UIEdgeInsets.zero
    
    var selected: Bool = false {
        didSet {
            button.isSelected = selected
            reloadButtonBackgroundColor()
        }
    }
    
    class var checkmarkImage: UIImage? {
        let bundle = Bundle(forClass: ImagePickerSheetController.self)
        let image = UIImage(named: "PreviewSupplementaryView-Checkmark", inBundle: bundle, compatibleWithTraitCollection: nil)
        
        return image?.imageWithRenderingMode(.AlwaysTemplate)
    }
    
    class var selectedCheckmarkImage: UIImage? {
        let bundle = Bundle(forClass: ImagePickerSheetController.self)
        let image = UIImage(named: "PreviewSupplementaryView-Checkmark-Selected", inBundle: bundle, compatibleWithTraitCollection: nil)
        
        return image?.withRenderingMode(.alwaysTemplate)
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        initialize()
    }
    
    private func initialize() {
        addSubview(button)
    }
    
    // MARK: - Other Methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        selected = false
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        reloadButtonBackgroundColor()
    }
    
    private func reloadButtonBackgroundColor() {
        button.backgroundColor = (selected) ? tintColor : nil
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.sizeToFit()
        button.frame.origin = CGPointMake(buttonInset.left, CGRect.height(bounds)-CGRectGetHeight(button.frame)-buttonInset.bottom)
        button.layer.cornerRadius = CGRect.height(button.frame) / 2.0
    }
    
}
