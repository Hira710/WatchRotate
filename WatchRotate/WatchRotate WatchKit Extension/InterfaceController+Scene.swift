//
//  ViewController.swift
//  WatchRotate WatchKit Extension
//
//  Created by mini2014a on 2019/11/19.
//  Copyright © 2019 HK. All rights reserved.
//

import UIKit
import SceneKit

extension InterfaceController{
    func initScene() {
        self.sceneInterface.scene = mainScene
    }
    func addCamera()  {
        self.cameraNode.camera = SCNCamera()
//        self.cameraNode.camera!.usesOrthographicProjection = true
        self.cameraNode.camera!.zNear = 0
        
        self.cameraNode.position = SCNVector3(x: 0, y: 0, z: 2)
        self.mainScene.rootNode.addChildNode(cameraNode)
    }
    func addLight() {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        self.mainScene.rootNode.addChildNode(lightNode)

        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        self.mainScene.rootNode.addChildNode(ambientLightNode)
    }
    func addCtrlSphere() {
        self.controlSphere.geometry = SCNSphere(radius: 1.2)
        self.controlSphere.geometry?.firstMaterial?.transparent.contents = UIColor(red: 1, green: 1, blue: 1, alpha: 0.0)

        self.controlSphereAnchor.addChildNode(self.controlSphere)
        self.mainScene.rootNode.addChildNode(self.controlSphereAnchor)
    }
    func addModel() {
        //base box
        let boxNode = SCNNode()
        boxNode.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        boxNode.geometry?.firstMaterial?.transparent.contents = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        //axis
        let axisX = SCNNode()
        axisX.geometry = SCNBox(width: 2, height: 0.01, length: 0.01, chamferRadius: 0)
        axisX.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        boxNode.addChildNode(axisX)
        
        let axisY = SCNNode()
        axisY.geometry = SCNBox(width: 0.01, height: 2, length: 0.01, chamferRadius: 0)
        axisY.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        boxNode.addChildNode(axisY)
        
        let axisZ = SCNNode()
        axisZ.geometry = SCNBox(width: 0.01, height: 0.01, length: 2, chamferRadius: 0)
        axisZ.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        boxNode.addChildNode(axisZ)
        
        
        self.controlSphere.addChildNode(boxNode)
    }
}
