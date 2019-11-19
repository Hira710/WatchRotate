//
//  MyNode.swift
//  WatchRotate WatchKit Extension
//
//  Created by mini2014a on 2019/11/19.
//  Copyright © 2019 HK. All rights reserved.
//

import SceneKit


class MyNode: SCNNode {
    var previousTouch: simd_float3?

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        func rotate(from previousTouch: simd_float3, to currentTouch: simd_float3 ,speed:Float){
    //        print("speed =  \(speed)")
            let previousTouch = simd_normalize(previousTouch)
            let currentTouch = simd_normalize(currentTouch)
            //make sure to normalize axis to make unit quaternion
            let axis = simd_normalize(simd_cross(currentTouch, previousTouch))
            
            // sometimes dot product goes outside the the range of -1 to 1
            // keep it in the range
            let dot = max(min(1, simd_dot(currentTouch, previousTouch)), -1)
            
            let angle = acosf(dot)*speed
            let rotation = simd_quaternion(-angle, axis)
            
            let length = rotation.length
            if !length.isNaN{
    //            SCNTransaction.begin()
    //            SCNTransaction.animationDuration = 0.15
                self.simdOrientation = rotation * self.simdOrientation
    //            SCNTransaction.commit()
            }
            //self.previousTouch = currentTouch
        }
}
