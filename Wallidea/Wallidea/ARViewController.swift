//
//  ARViewController.swift
//  Wallidea
//
//  Created by 查明轩 on 2018/8/2.
//  Copyright © 2018 Wallidea. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ARViewController: UIViewController, ARSKViewDelegate {
	
	@IBOutlet var sceneView: ARSKView!
	
	@IBOutlet weak var imageSizeSlider: UISlider!
	var currentImageNode: SKSpriteNode!
	var currentImageAnchor: ARAnchor!
	var currentImageWidth: CGFloat!
	var currentImageHeight: CGFloat!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Set the view's delegate
		sceneView.delegate = self
		
		// Show statistics such as fps and node count
		sceneView.showsFPS = true
		sceneView.showsNodeCount = true
		
		// Load the SKScene from 'Scene.sks'
		if let scene = SKScene(fileNamed: "Scene") {
			sceneView.presentScene(scene)
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		// Create a session configuration
		let configuration = ARWorldTrackingConfiguration()
		
		// Run the view's session
		sceneView.session.run(configuration)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		// Pause the view's session
		sceneView.session.pause()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Release any cached data, images, etc that aren't in use.
	}
	
	// MARK: - ARSKViewDelegate
	
	func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
		// Create and configure a node for the anchor added to the view's session.
		currentImageAnchor = anchor
		currentImageNode = SKSpriteNode(imageNamed: "idea")
		currentImageNode.name = "idea"
		currentImageWidth = currentImageNode.size.width
		currentImageHeight = currentImageNode.size.height
		return currentImageNode;
	}
	
	@IBAction func applyImage(_ sender: Any) {
		// Create anchor using the camera's current position
		if let currentFrame = sceneView.session.currentFrame {
			// Measure the distance from the camera to the wall
			// if the wall is not detected, set default distance value to 1 meter
			var distanceCameraToWall = -1.0 as Float
			for result in sceneView.hitTest(CGPoint(x: 0.5, y: 0.5), types:[.existingPlaneUsingExtent, .featurePoint]) {
				distanceCameraToWall = Float(-result.distance)
			}
			// Create a transform with a translation of 1 meters in front of the camera
			var translation = matrix_identity_float4x4
			translation.columns.3.z = distanceCameraToWall
			let transform = simd_mul(currentFrame.camera.transform, translation)
			// Add a new anchor to the session
			let anchor = ARAnchor(transform: transform)
			sceneView.session.add(anchor: anchor)
		}
	}
	@IBAction func imageSizeSliderChanged(_ sender: Any) {
		currentImageNode.size.width = CGFloat(Float(currentImageWidth) * pow(10,imageSizeSlider.value-0.5))
		currentImageNode.size.height = CGFloat(Float(currentImageHeight) * pow(10,imageSizeSlider.value-0.5))
	}

	func session(_ session: ARSession, didFailWithError error: Error) {
		// Present an error message to the user
		
	}
	
	func sessionWasInterrupted(_ session: ARSession) {
		// Inform the user that the session has been interrupted, for example, by presenting an overlay
		
	}
	
	func sessionInterruptionEnded(_ session: ARSession) {
		// Reset tracking and/or remove existing anchors if consistent tracking is required
		
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
