//
//  CreateMetalClass.swift
//  SampleClearingScreen
//
//  Created by Pradipta Das on 12/07/17.
//  Copyright © 2017 Pradipta Das. All rights reserved.
//

import MetalKit

class CreateMetalClass: MTKView {
    
    var renderer : Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice() //create gpu device one time only(view)
        self.colorPixelFormat = .bgra8Unorm          //declare pixel format
        self.clearColor = MTLClearColor(red: 1.55, green: 0.99, blue: 0.30, alpha: 1)
        
        renderer = Renderer(device: device!)
        
        self.delegate = renderer
    }

    
}
