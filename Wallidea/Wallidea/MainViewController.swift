//
//  MainViewController.swift
//  Wallidea
//
//  Created by 查明轩 on 2018/8/1.
//  Copyright © 2018 Wallidea. All rights reserved.
//

import UIKit
import MobileCoreServices
import AssetsLibrary

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func toARKitButton(_ sender: Any) {
		self.performSegue(withIdentifier: "ToARKit", sender: self)
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
class ViewControllerTwo:UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //choose the photo library
    @IBAction func formAlbum(_sender:AnyObject){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //initial the img controller
            let picker = UIImagePickerController()
            //setup the picker
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
           
            self.present(picker,animated:true,completion: {
                () -> Void in
            })
        }else{
            print("unable to choose the photo")
        }
    }
    @IBAction func choosePhoto(_ sender: Any) {
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        let image:UIImage!
       
            image=info[UIImagePickerControllerOriginalImage]as!UIImage
        imageView.image = image
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
