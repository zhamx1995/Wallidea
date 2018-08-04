//
//  Scene.swift
//  Wallidea
//
//  Created by 查明轩 on 2018/7/31.
//  Copyright © 2018 Wallidea. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    override func didMove(to view: SKView) {
        // Setup your scene here
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let sceneView = self.view as? ARSKView else {
//            return
//        }
		
//        // Create anchor using the camera's current position
//        if let currentFrame = sceneView.session.currentFrame {
//			// Measure the distance from the camera to the wall
//			// if the wall is not detected, set default distance value to 1 meter
//			var distanceCameraToWall = -1.0 as Float
//			for result in sceneView.hitTest(CGPoint(x: 0.5, y: 0.5), types:[.existingPlaneUsingExtent, .featurePoint]) {
//				distanceCameraToWall = Float(-result.distance)
//			}
//            // Create a transform with a translation of 1 meters in front of the camera
//            var translation = matrix_identity_float4x4
//            translation.columns.3.z = distanceCameraToWall
//            let transform = simd_mul(currentFrame.camera.transform, translation)
//            // Add a new anchor to the session
//            let anchor = ARAnchor(transform: transform)
//            sceneView.session.add(anchor: anchor)
//        }
    }
}
