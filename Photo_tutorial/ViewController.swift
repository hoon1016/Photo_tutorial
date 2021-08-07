//
//  ViewController.swift
//  Photo_tutorial
//
//  Created by 임재훈 on 2021/08/07.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileChange: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2
        self.profileChange.layer.cornerRadius = 10
        
        // 버튼클릭 액션 설정
        self.profileChange.addTarget(self, action: #selector(onProFileChangeBtnClick), for: .touchUpInside)
    }
    
    // 프사 변경 버튼이 클릭되었을때
    @objc fileprivate func onProFileChangeBtnClick(){
        print("ViewController - onProFileChangeBtnClick() called")
        
        //카메라 라이브러리 셋팅
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo, .video]
        
        let picker = YPImagePicker(configuration: config)
        
        // 사진이 선택되었을때
        picker.didFinishPicking { [unowned picker] items, _ in
            
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                // 프사이미지를 변경하면 된다.
                self.profileImage.image = photo.image
            }
            // 사진 선택창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        // 사진 선택창 보여주기
        present(picker, animated: true, completion: nil)
    }
    
    
}

