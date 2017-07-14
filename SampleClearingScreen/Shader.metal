//
//  Shader.metal
//  SampleClearingScreen
//
//  Created by Pradipta Das on 14/07/17.
//  Copyright © 2017 Pradipta Das. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

//creating vertex function(pass the data for creating the vertices)

vertex float4 create_vertex_function(){
    return float4  (1); //similar to return float4(1,1,1,1)
}

fragment float4 create_fragment_function(){
    return float4  (1); //similar to return float4(1,1,1,1)
}



