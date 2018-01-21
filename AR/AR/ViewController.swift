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
        var cubeNode = SCNNode(geometry: SCNSphere(radius: 0.08))
        
        let cc = getCameraCord(sceneView: SceneView)
        
        
        
        cubeNode.position = SCNVector3(cc.x, cc.y, cc.z)
        cubeNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "diffuse")
        cubeNode.geometry?.firstMaterial?.specular.contents = UIImage(named: "specular")
        cubeNode.geometry?.firstMaterial?.emission.contents = UIImage(named: "e")
        cubeNode.geometry?.firstMaterial?.normal.contents = UIImage(named: "normal")
        SceneView.scene.rootNode.addChildNode(cubeNode)
        
          let action = SCNAction.rotate(by: 360*CGFloat((M_PI)/180.0), around: SCNVector3(x:0,y:1,z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
          cubeNode.runAction(repeatAction)
    }
    
    @IBAction func addCup(_ sender: Any) {
        let cupNode = SCNNode()
        
        let cc = getCameraCord(sceneView: SceneView)
        
        cupNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        guard let VirtualObjectScene = SCNScene(named: "cup.scn", inDirectory: "Models.scnassets/cup")
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
        
        guard let VirtualObjectScene = SCNScene(named: "candle.scn", inDirectory: "Models.scnassets/candle")
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
        
        guard let VirtualObjectScene = SCNScene(named: "chair.scn", inDirectory: "Models.scnassets/chair")
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
        
        guard let VirtualObjectScene = SCNScene(named: "lamp.scn", inDirectory: "Models.scnassets/lamp")
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
        
        guard let VirtualObjectScene = SCNScene(named: "vase.scn", inDirectory: "Models.scnassets/vase")
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

