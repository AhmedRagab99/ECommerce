//
//  RoundedViews.swift
//  SimpleECommerce
//
//  Created by Ahmed Ragab on 3/7/20.
//  Copyright © 2020 Ahmed Ragab. All rights reserved.
//
import UIKit


class RoundedButton:UIButton{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}

class RoundedShadowView:UIView{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = AppColors.blueColor.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize.zero
    }
}


class RoundedImage:UIImageView{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}
