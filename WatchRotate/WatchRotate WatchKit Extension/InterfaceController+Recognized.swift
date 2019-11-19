//
//  ViewController.swift
//  WatchRotate WatchKit Extension
//
//  Created by mini2014a on 2019/11/19.
//  Copyright © 2019 HK. All rights reserved.
//

import WatchKit
import SceneKit

extension InterfaceController {
    @IBAction func panRecognized(_ sender: AnyObject) {
        if let panGesture = sender as? WKPanGestureRecognizer {
            
            let touchPoint = panGesture.locationInObject()
            
            let hitResults: [SCNHitTestResult] = self.sceneInterface.hitTest(touchPoint, options:[:])
            if let hit = hitResults.first, hit.node == self.controlSphere {
                self.touchedObject = self.controlSphere
                let worldTouch = simd_float3(hit.worldCoordinates)
                
                switch panGesture.state{
                case .began:
                    updateQueue.async {
                        self.touchedObject?.previousTouch = worldTouch
                    }
                case .changed:
                    updateQueue.async {
                        if let touchedObject = self.touchedObject,
                            var previousTouch = touchedObject.previousTouch{
                            
                            let currentTouch = self.controlSphereAnchor.simdConvertPosition(worldTouch, from: nil)
                            previousTouch =  self.controlSphereAnchor.simdConvertPosition(previousTouch, from: nil)
                            
                            self.touchedObject?.rotate(from: previousTouch, to: currentTouch, speed: 1)
                            self.touchedObject?.previousTouch = worldTouch

                        }
                    }
                case .ended:
                    clear()
                default: break
                }
            }else{
                clear()
            }
        }
    }
    internal func clear(){
        updateQueue.async {
            self.touchedObject?.previousTouch = nil
        }
    }
}
