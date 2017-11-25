//
//  ViewController.swift
//  AR
//
//  Created by Rahul Dhiman on 25/11/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet weak var SceneView: ARSCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        SceneView.session.run(configuration)
        
    }
    
    
    @IBAction func addCube(_ sender: Any) {
        var cubeNode = SCNNode(geometry: SCNBox(width:0.1, height:0.1, length: 0.1, chamferRadius:0 ))
        
        let cc = getCameraCord(sceneView: SceneView)
        
        cubeNode.position = SCNVector3(cc.x, cc.y, cc.z)
        SceneView.scene.rootNode.addChildNode(cubeNode)
    }
    
    @IBAction func addCup(_ sender: Any) {
        let cupNode = SCNNode()
        
        let cc = getCameraCord(sceneView: SceneView)
        
        cupNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let VirtualObjectScene = SCNScene(named: "cup.scn", inDirectory: "Models.scnassets")
            else{
        return
        }
        
        let wrapperNode = SCNNode()
        for child in VirtualObjectScene.rootNode.childNodes{
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        
        cupNode.addChildNode(wrapperNode)
        
        SceneView.scene.rootNode.addChildNode(cupNode)
        
        
    }
    
    @IBAction func addCandle(_ sender: Any) {
        let candleNode = SCNNode()
        
        let cc = getCameraCord(sceneView: SceneView)
        
        candleNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let VirtualObjectScene = SCNScene(named: "candle.scn", inDirectory: "Models.scnassets")
            else{
                return
        }
        
        let wrapperNode = SCNNode()
        for child in VirtualObjectScene.rootNode.childNodes{
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        
        candleNode.addChildNode(wrapperNode)
        
        SceneView.scene.rootNode.addChildNode(candleNode)
    }
    
    @IBAction func addChair(_ sender: Any) {
        
        let chairNode = SCNNode()
        
        let cc = getCameraCord(sceneView: SceneView)
        
        chairNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let VirtualObjectScene = SCNScene(named: "chair.scn", inDirectory: "Models.scnassets")
            else{
                return
        }
        
        let wrapperNode = SCNNode()
        for child in VirtualObjectScene.rootNode.childNodes{
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        
        chairNode.addChildNode(wrapperNode)
        
        SceneView.scene.rootNode.addChildNode(chairNode)
    }
    
    @IBAction func addLamp(_ sender: Any) {
        let lampNode = SCNNode()
        
        let cc = getCameraCord(sceneView: SceneView)
        
        lampNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let VirtualObjectScene = SCNScene(named: "lamp.scn", inDirectory: "Models.scnassets")
            else{
                return
        }
        
        let wrapperNode = SCNNode()
        for child in VirtualObjectScene.rootNode.childNodes{
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        
        lampNode.addChildNode(wrapperNode)
        
        SceneView.scene.rootNode.addChildNode(lampNode)
    }
    
    @IBAction func addVase(_ sender: Any) {
        let vaseNode = SCNNode()
        
        let cc = getCameraCord(sceneView: SceneView)
        
        vaseNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let VirtualObjectScene = SCNScene(named: "cup.scn", inDirectory: "Models.scnassets")
            else{
                return
        }
        
        let wrapperNode = SCNNode()
        for child in VirtualObjectScene.rootNode.childNodes{
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            wrapperNode.addChildNode(child)
        }
        
        vaseNode.addChildNode(wrapperNode)
        
        SceneView.scene.rootNode.addChildNode(vaseNode)
    }
    
    
    struct myCameraCord {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    
    func getCameraCord(sceneView: ARSCNView) -> myCameraCord {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCord = MDLTransform(matrix: cameraTransform!)
        
        var cc = myCameraCord()
        cc.x = cameraCord.translation.x
        cc.y = cameraCord.translation.y
        cc.z = cameraCord.translation.z
        
        return cc
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

