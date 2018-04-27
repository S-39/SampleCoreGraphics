//
//  SecondViewController.swift
//  Sample Core Graphics
//
//  Created by nakaura seiji on 2018/04/11.
//  Copyright © 2018年 nakaura seiji. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var showImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func blendImage(_ sender: Any) {
        //縦2000,横1200のキャンバス作成
        let render = UIGraphicsImageRenderer(size: CGSize(width: 1200, height: 2000))
        
        let img = render.image(actions: { ctx in
            //UIImageを戻り値に返す
            let rectangle = CGRect(x: 0, y: 0, width: 1200, height: 2000)
            self.showImg.image?.draw(in: rectangle)
            //赤の四角形を追加
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            let rectangleRect = CGRect(x: 200, y: 900, width: 600, height: 200)
            ctx.cgContext.addRect(rectangleRect)
            ctx.cgContext.drawPath(using: .fillStroke)
            //現在のコンテキストにイメージビューの画像を描写
           
        })
        self.showImg.image = img
        
        /*
         よくあるやり方
         UIGraphicsBeginImageContext(CGSize(width: 1000, height: 2000))
         self.showImg.image?.draw(in: CGRect(x: self.showImg.bounds.minX, y: self.showImg.bounds.minY, width: 1000, height: 2000))
         let n = UIGraphicsGetImageFromCurrentImageContext()
        
         UIGraphicsEndImageContext()
         
         self.showImg.image = n!
         */
        
        
        
    }
    

}
