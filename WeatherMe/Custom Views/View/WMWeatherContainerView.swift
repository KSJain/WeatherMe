//
//  WMWeatherContainerView.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import UIKit

class WMWeatherContainerView: UIView {
    
    private var radious: CGFloat    = 0
    private var tempLabel           = WMTitleLabel()
    private var feelsLikeLabel      = WMTitleLabel()
    private var iconImageView       = WMIconImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.radious                = 100
        configure()
    }
    
    init(radious: CGFloat) {
        super.init(frame: .zero)
        self.radious                = radious
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewFor(viewModel: CurrentWeatherViewModel) {
        tempLabel.text              = viewModel.temperature
        feelsLikeLabel.text         = viewModel.feelsLike
        iconImageView.setImageFor(name: viewModel.weatherIconName)
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints   = false
        
        layer.cornerRadius          = radious
        layer.borderWidth           = 3
        layer.borderColor           = UIColor.white.cgColor
        backgroundColor             = UIColor(white: 0.3, alpha: 0.5)
        
        // Curr Temp
        let tempFontSize: CGFloat   = radious *  0.6
        tempLabel                   = WMTitleLabel(textAlignment: .center, fontSize: tempFontSize)
        tempLabel.textColor         = .label
        addSubview(tempLabel)
        
        // Feels
        let feelsFontSize: CGFloat   = radious *  0.2
        feelsLikeLabel               = WMTitleLabel(textAlignment: .center, fontSize: feelsFontSize)
        feelsLikeLabel.textColor     = .label
        addSubview(feelsLikeLabel)
        
        // Icon
        addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: radious * 0.9),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tempLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -radious * 0.2),
            tempLabel.widthAnchor.constraint(equalToConstant: tempFontSize * 2.5),
            tempLabel.heightAnchor.constraint(equalToConstant: tempFontSize * 1.3),
            
            feelsLikeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            feelsLikeLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            feelsLikeLabel.widthAnchor.constraint(equalToConstant: radious * 1.4),
            feelsLikeLabel.heightAnchor.constraint(equalToConstant: feelsFontSize * 1.2 )
        ])
    }
}
