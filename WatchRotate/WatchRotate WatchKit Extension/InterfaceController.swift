//
//  InterfaceController.swift
//  WatchRotate WatchKit Extension
//
//  Created by mini2014a on 2019/11/19.
//  Copyright © 2019 HK. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var sceneInterface: WKInterfaceSCNScene!
    
    let mainScene = SCNScene()
    let cameraNode = SCNNode()
    
    let controlSphereAnchor = SCNNode()
    let controlSphere = MyNode()
    var touchedObject: MyNode?
    let updateQueue = DispatchQueue(label: "update queue")
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        initScene()
        addCamera()
        addLight()
        addCtrlSphere()
        addModel()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
