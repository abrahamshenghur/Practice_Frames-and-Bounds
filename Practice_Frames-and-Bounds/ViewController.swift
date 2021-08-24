//
//  ViewController.swift
//  Practice_Frames-and-Bounds
//
//  Created by Abraham on 8/24/21.
//  Copyright © 2021 Abraham Shenghur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let grayBox             = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200)) // .zero doens't seem to update labels
    let innerBox            = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))  // same here for the labels
    let innerBoxTop         = UIView(frame: .zero)
    
    let frameX              = UILabel(frame: .zero)
    let frameXSlider        = UISlider(frame: .zero)
    
    let frameY              = UILabel(frame: .zero)
    let frameYSlider        = UISlider(frame: .zero)
    
    let frameWidth          = UILabel(frame: .zero)
    let frameWidthSlider    = UISlider(frame: .zero)
    
    let frameHeight         = UILabel(frame: .zero)
    let frameHeightSlider   = UISlider(frame: .zero)
    
    let boundsX             = UILabel(frame: .zero)
    let boundsXSlider       = UISlider(frame: .zero)
    
    let boundsY             = UILabel(frame: .zero)
    let boundsYSlider       = UISlider(frame: .zero)
    
    let centerX             = UILabel(frame: .zero)
    let centerXSlider       = UISlider(frame: .zero)
    
    let centerY             = UILabel(frame: .zero)
    let centerYSlider       = UISlider(frame: .zero)
    
    let rotation            = UILabel(frame: .zero)
    let rotationSlider      = UISlider(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureViews()
        layoutUI()
    }
    
    
    func addSubviews() {
        view.addSubview(grayBox)
        grayBox.addSubview(innerBox)
        innerBox.addSubview(innerBoxTop)
        
        view.addSubview(frameXSlider)
        view.addSubview(frameX)
        
        view.addSubview(frameYSlider)
        view.addSubview(frameY)
        
        view.addSubview(frameWidthSlider)
        view.addSubview(frameWidth)
        
        view.addSubview(frameHeightSlider)
        view.addSubview(frameHeight)
        
        view.addSubview(boundsXSlider)
        view.addSubview(boundsX)
        
        view.addSubview(boundsYSlider)
        view.addSubview(boundsY)
        
        view.addSubview(centerXSlider)
        view.addSubview(centerX)
        
        view.addSubview(centerYSlider)
        view.addSubview(centerY)
        
        view.addSubview(rotationSlider)
        view.addSubview(rotation)
    }
    
    
    func configureViews() {
        grayBox.backgroundColor = .lightGray
        grayBox.clipsToBounds = true
        
        innerBox.backgroundColor = .yellow
        innerBoxTop.backgroundColor = .black
        
        frameX.text = "frame x = 0"
        frameXSlider.minimumValue = 0
        frameXSlider.maximumValue = 190
        frameXSlider.addTarget(self, action: #selector(frameXDidChange), for: .valueChanged)
        
        frameY.text = "frame y = 0"
        frameYSlider.minimumValue = 0
        frameYSlider.maximumValue = 190
        frameYSlider.addTarget(self, action: #selector(frameYDidChange), for: .valueChanged)
        
        frameWidth.text = "frame width = 40"
        frameWidthSlider.minimumValue = 40
        frameWidthSlider.maximumValue = 80
        frameWidthSlider.addTarget(self, action: #selector(frameWidthDidChange), for: .valueChanged)
        
        frameHeight.text = "frame height = 40"
        frameHeightSlider.minimumValue = 40
        frameHeightSlider.maximumValue = 80
        frameHeightSlider.addTarget(self, action: #selector(frameHeightDidChange), for: .valueChanged)
        
        boundsX.text = "bounds x (grayBox) = 0"
        boundsXSlider.minimumValue = 0
        boundsXSlider.maximumValue = 200
        boundsXSlider.addTarget(self, action: #selector(boundsXDidChange), for: .valueChanged)
        
        boundsY.text = "bounds y (grayBox) = 0"
        boundsYSlider.minimumValue = 0
        boundsYSlider.maximumValue = 200
        boundsYSlider.addTarget(self, action: #selector(boundsYDidChange), for: .valueChanged)
        
        centerX.text = "center x = 20"
        centerXSlider.minimumValue = 20
        centerXSlider.maximumValue = 190
        centerXSlider.addTarget(self, action: #selector(centerXDidChange), for: .valueChanged)
        
        centerY.text = "center y = 20"
        centerYSlider.minimumValue = 20
        centerYSlider.maximumValue = 190
        centerYSlider.addTarget(self, action: #selector(centerYDidChange), for: .valueChanged)
        
        rotation.text = "rotation = 0"
        rotationSlider.minimumValue = 0
        rotationSlider.maximumValue = 3.14159265359 * 1.95
        rotationSlider.addTarget(self, action: #selector(rotationDidChange), for: .valueChanged)
    }
    
    
    func updateLabels() {
        let innerBoxFrame  = innerBox.frame
        let grayBoxBounds  = grayBox.bounds
        let innerBoxCenter = innerBox.center
        
        frameX.text      = "frame x = \(Int(innerBoxFrame.origin.x))"
        frameY.text      = "frame y = \(Int(innerBoxFrame.origin.y))"
        frameWidth.text  = "frame width = \(Int(innerBoxFrame.size.width))"
        frameHeight.text = "frame height = \(Int(innerBoxFrame.size.height))"
        boundsX.text     = "bounds x (grayBox) = \(Int(grayBoxBounds.origin.x))"
        boundsY.text     = "bounds y (grayBox) = \(Int(grayBoxBounds.origin.y))"
        centerX.text     = "center x = \(Int(innerBoxCenter.x))"
        centerY.text     = "center y = \(Int(innerBoxCenter.y))"
        rotation.text    = "rotation = \(rotationSlider.value)"
    }
    
    
    @objc func frameXDidChange() {
        innerBox.frame.origin.x = CGFloat(frameXSlider.value)
        centerXSlider.value = Float(innerBox.center.x)
        updateLabels()
    }
    
    
    @objc func frameYDidChange() {
        innerBox.frame.origin.y = CGFloat(frameYSlider.value)
        centerYSlider.value = Float(innerBox.center.y)
        updateLabels()
    }
    
    
    @objc func frameWidthDidChange() {
        innerBox.frame.size.width = CGFloat(frameWidthSlider.value)
        centerXSlider.value = Float(innerBox.center.x)
        updateLabels()
    }
    
    
    @objc func frameHeightDidChange() {
        innerBox.frame.size.height = CGFloat(frameHeightSlider.value)
        centerYSlider.value = Float(innerBox.center.y)
        updateLabels()
    }
    
    
    @objc func boundsXDidChange() {
        grayBox.bounds.origin.x = CGFloat(boundsXSlider.value)
        updateLabels()
    }
    
    
    @objc func boundsYDidChange() {
        grayBox.bounds.origin.y = CGFloat(boundsYSlider.value)
        updateLabels()
    }
    
    
    @objc func centerXDidChange() {
        innerBox.center.x = CGFloat(centerXSlider.value)
        frameXSlider.value = Float(innerBox.frame.origin.x)
        updateLabels()
    }
    
    
    @objc func centerYDidChange() {
        innerBox.center.y = CGFloat(centerYSlider.value)
        frameYSlider.value = Float(innerBox.frame.origin.y)
        updateLabels()
    }
    
    
    @objc func rotationDidChange() {
        let rotation = CGAffineTransform(rotationAngle: CGFloat(rotationSlider.value))
        innerBox.transform = rotation
        updateLabels()
    }
    
    
    func layoutUI() {
        grayBox.translatesAutoresizingMaskIntoConstraints           = false
        
        innerBoxTop.translatesAutoresizingMaskIntoConstraints       = false
        
        frameX.translatesAutoresizingMaskIntoConstraints            = false
        frameXSlider.translatesAutoresizingMaskIntoConstraints      = false
        
        frameY.translatesAutoresizingMaskIntoConstraints            = false
        frameYSlider.translatesAutoresizingMaskIntoConstraints      = false
        
        frameWidth.translatesAutoresizingMaskIntoConstraints        = false
        frameWidthSlider.translatesAutoresizingMaskIntoConstraints  = false
        
        frameHeight.translatesAutoresizingMaskIntoConstraints       = false
        frameHeightSlider.translatesAutoresizingMaskIntoConstraints = false
        
        boundsX.translatesAutoresizingMaskIntoConstraints           = false
        boundsXSlider.translatesAutoresizingMaskIntoConstraints     = false
        
        boundsY.translatesAutoresizingMaskIntoConstraints           = false
        boundsYSlider.translatesAutoresizingMaskIntoConstraints     = false
        
        centerX.translatesAutoresizingMaskIntoConstraints           = false
        centerXSlider.translatesAutoresizingMaskIntoConstraints     = false
        
        centerY.translatesAutoresizingMaskIntoConstraints           = false
        centerYSlider.translatesAutoresizingMaskIntoConstraints     = false
        
        rotation.translatesAutoresizingMaskIntoConstraints          = false
        rotationSlider.translatesAutoresizingMaskIntoConstraints    = false
        
        
        let padding                     = CGFloat(2)
        let sliderLeadingEdgePadding    = CGFloat(10)
        let sliderWidth                 = CGFloat(160)
        let sliderHeight                = CGFloat(45)
        
        NSLayoutConstraint.activate([
            grayBox.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            grayBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            grayBox.widthAnchor.constraint(equalToConstant: 200),
            grayBox.heightAnchor.constraint(equalToConstant: 200),
            
            innerBoxTop.centerXAnchor.constraint(equalTo: innerBox.centerXAnchor),
            innerBoxTop.topAnchor.constraint(equalTo: innerBox.topAnchor),
            innerBoxTop.widthAnchor.constraint(equalToConstant: 6),
            innerBoxTop.heightAnchor.constraint(equalToConstant: 20),
            
            frameXSlider.topAnchor.constraint(equalTo: grayBox.bottomAnchor, constant: padding),
            frameXSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sliderLeadingEdgePadding),
            frameXSlider.widthAnchor.constraint(equalToConstant: sliderWidth),
            frameXSlider.heightAnchor.constraint(equalToConstant: sliderHeight),
            frameX.topAnchor.constraint(equalTo: frameXSlider.topAnchor),
            frameX.leadingAnchor.constraint(equalTo: frameXSlider.trailingAnchor, constant: 5),
            frameX.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            frameX.heightAnchor.constraint(equalToConstant: sliderHeight),
            
            frameYSlider.topAnchor.constraint(equalTo: frameXSlider.bottomAnchor, constant: padding),
            frameYSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sliderLeadingEdgePadding),
            frameYSlider.widthAnchor.constraint(equalToConstant: sliderWidth),
            frameYSlider.heightAnchor.constraint(equalToConstant: sliderHeight),
            frameY.topAnchor.constraint(equalTo: frameYSlider.topAnchor),
            frameY.leadingAnchor.constraint(equalTo: frameYSlider.trailingAnchor, constant: 5),
            frameY.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            frameY.heightAnchor.constraint(equalToConstant: sliderHeight),
            
            frameWidthSlider.topAnchor.constraint(equalTo: frameYSlider.bottomAnchor, constant: padding),
            frameWidthSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sliderLeadingEdgePadding),
            frameWidthSlider.widthAnchor.constraint(equalToConstant: sliderWidth),
            frameWidthSlider.heightAnchor.constraint(equalToConstant: sliderHeight),
            frameWidth.topAnchor.constraint(equalTo: frameWidthSlider.topAnchor),
            frameWidth.leadingAnchor.constraint(equalTo: frameWidthSlider.trailingAnchor, constant: 5),
            frameWidth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            frameWidth.heightAnchor.constraint(equalToConstant: sliderHeight),
            
            frameHeightSlider.topAnchor.constraint(equalTo: frameWidthSlider.bottomAnchor, constant: padding),
            frameHeightSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sliderLeadingEdgePadding),
            frameHeightSlider.widthAnchor.constraint(equalToConstant: sliderWidth),
            frameHeightSlider.heightAnchor.constraint(equalToConstant: sliderHeight),
            frameHeight.topAnchor.constraint(equalTo: frameHeightSlider.topAnchor),
            frameHeight.leadingAnchor.constraint(equalTo: frameHeightSlider.trailingAnchor, constant: 5),
            frameHeight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            frameHeight.heightAnchor.constraint(equalToConstant: sliderHeight),
            
            boundsXSlider.topAnchor.constraint(equalTo: frameHeightSlider.bottomAnchor, constant: padding),
            boundsXSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sliderLeadingEdgePadding),
            boundsXSlider.widthAnchor.constraint(equalToConstant: sliderWidth),
            boundsXSlider.heightAnchor.constraint(equalToConstant: sliderHeight),
            boundsX.topAnchor.constraint(equalTo: boundsXSlider.topAnchor),
            boundsX.leadingAnchor.constraint(equalTo: boundsXSlider.trailingAnchor, constant: 5),
            boundsX.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            boundsX.heightAnchor.constraint(equalToConstant: sliderHeight),
            
            boundsYSlider.topAnchor.constraint(equalTo: boundsXSlider.bottomAnchor, constant: padding),
            boundsYSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sliderLeadingEdgePadding),
            boundsYSlider.widthAnchor.constraint(equalToConstant: sliderWidth),
            boundsYSlider.heightAnchor.constraint(equalToConstant: sliderHeight),
            boundsY.topAnchor.constraint(equalTo: boundsYSlider.topAnchor),
            boundsY.leadingAnchor.constraint(equalTo: boundsYSlider.trailingAnchor, constant: 5),
            boundsY.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            boundsY.heightAnchor.constraint(equalToConstant: sliderHeight),
            
            centerXSlider.topAnchor.constraint(equalTo: boundsYSlider.bottomAnchor, constant: padding),
            centerXSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sliderLeadingEdgePadding),
            centerXSlider.widthAnchor.constraint(equalToConstant: sliderWidth),
            centerXSlider.heightAnchor.constraint(equalToConstant: sliderHeight),
            centerX.topAnchor.constraint(equalTo: centerXSlider.topAnchor),
            centerX.leadingAnchor.constraint(equalTo: centerXSlider.trailingAnchor, constant: 5),
            centerX.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            centerX.heightAnchor.constraint(equalToConstant: sliderHeight),
            
            centerYSlider.topAnchor.constraint(equalTo: centerXSlider.bottomAnchor, constant: padding),
            centerYSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sliderLeadingEdgePadding),
            centerYSlider.widthAnchor.constraint(equalToConstant: sliderWidth),
            centerYSlider.heightAnchor.constraint(equalToConstant: sliderHeight),
            centerY.topAnchor.constraint(equalTo: centerYSlider.topAnchor),
            centerY.leadingAnchor.constraint(equalTo: centerYSlider.trailingAnchor, constant: 5),
            centerY.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            centerY.heightAnchor.constraint(equalToConstant: sliderHeight),
            
            rotationSlider.topAnchor.constraint(equalTo: centerYSlider.bottomAnchor, constant: padding),
            rotationSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sliderLeadingEdgePadding),
            rotationSlider.widthAnchor.constraint(equalToConstant: sliderWidth),
            rotationSlider.heightAnchor.constraint(equalToConstant: sliderHeight),
            rotation.topAnchor.constraint(equalTo: rotationSlider.topAnchor),
            rotation.leadingAnchor.constraint(equalTo: rotationSlider.trailingAnchor, constant: 5),
            rotation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            rotation.heightAnchor.constraint(equalToConstant: sliderHeight),
            ])
    }
}

