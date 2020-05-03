//
//  WMForecastCell.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import UIKit

class WMForecastCell: UITableViewCell {
    
    static let reuseID          = "weatherForecastCell"
    var iconArtView             = WMIconImageView(frame: .zero)
    var tempratureLabelView     = WMTitleLabel()
    var dateLabel               = WMSecondaryTitleLabel()
    var timeLabel               = WMSecondaryTitleLabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(with forecast: Forecast) {
        iconArtView.setImageFor(name: forecast.icon)
        tempratureLabelView.text    = forecast.temprature
        dateLabel.text              = forecast.date
        timeLabel.text              = forecast.time
    }
    
    private func configure() {
        let padding: CGFloat        = 8
        let imagePadding: CGFloat   = 20
        let imageSize: CGFloat      = 100
        
        let tempFontSize: CGFloat   = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 35
        let dateAndTimeFontSize: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 8 : 15
        
        iconArtView             = WMIconImageView(frame: .zero)
        tempratureLabelView     = WMTitleLabel(textAlignment: .center, fontSize: tempFontSize)
        dateLabel               = WMSecondaryTitleLabel(textAlignment: .right, fontSize: dateAndTimeFontSize)
        timeLabel               = WMSecondaryTitleLabel(textAlignment: .right, fontSize: dateAndTimeFontSize)
        
        [iconArtView, tempratureLabelView, dateLabel, timeLabel].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            iconArtView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconArtView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            iconArtView.heightAnchor.constraint(equalToConstant: imageSize),
            iconArtView.widthAnchor.constraint(equalToConstant: imageSize),
            
            tempratureLabelView.topAnchor.constraint(equalTo: topAnchor),
            tempratureLabelView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tempratureLabelView.leadingAnchor.constraint(equalTo: iconArtView.trailingAnchor, constant: padding),
            tempratureLabelView.widthAnchor.constraint(equalTo: tempratureLabelView.heightAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: tempratureLabelView.trailingAnchor, constant: imagePadding),
            
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -38),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            timeLabel.heightAnchor.constraint(equalToConstant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: tempratureLabelView.trailingAnchor, constant: imagePadding),
        ])
    }
}

