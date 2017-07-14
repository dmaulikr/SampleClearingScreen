//
//  Renderer.swift
//  SampleClearingScreen
//
//  Created by Pradipta Das on 14/07/17.
//  Copyright © 2017 Pradipta Das. All rights reserved.
//

import MetalKit

class Renderer: NSObject {
    
    var commandQueue :MTLCommandQueue! //one time creation, responsible for handling the push-pop of different views
    var renderPipelineState : MTLRenderPipelineState! //application needs renderePipeLineState to build
                                                      //the view in GPU..One time creation
    init(device: MTLDevice){
        super.init()
        
        buildCommandQueue(device: device);
        buildPipelineState(device: device);
    }
    
    func buildCommandQueue(device: MTLDevice!){
        commandQueue = device.makeCommandQueue()
    }
    
    func buildPipelineState(device: MTLDevice!){
        
        //creating a library to build vertex function and fragment function
        let myLibrary = device.newDefaultLibrary()
        let myVertexFunction = myLibrary?.makeFunction(name: "create_vertex_function");
        let myFragmentFunction = myLibrary?.makeFunction(name: "create_fragment_function");
        
        //creating render pipeline descriptor
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        
        renderPipelineDescriptor.vertexFunction = myVertexFunction
        renderPipelineDescriptor.fragmentFunction = myFragmentFunction
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        //putting the descriptor into the pipelinestate
        
        do{
            renderPipelineState = try device.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
        }catch let error as NSError{
            Swift.print("\(error)")
        }
        

    }
}

extension Renderer: MTKViewDelegate{

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        
        guard let myDrawable = view.currentDrawable, let renderpassdescriptor = view.currentRenderPassDescriptor else{return}
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderpassdescriptor)
        
        commandEncoder.setRenderPipelineState(renderPipelineState)
        commandEncoder.endEncoding()
        commandBuffer.present(myDrawable)
        commandBuffer.commit()
        
    }
}









