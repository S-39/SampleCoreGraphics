//
//  ViewController.swift
//  Sample Core Graphics
//
//  Created by nakaura seiji on 2018/04/04.
//  Copyright © 2018年 nakaura seiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.currentImage()
       //self.draw()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func drawCurrentImage(_ sender: Any) {
        let render = UIGraphicsImageRenderer(size: CGSize(width: self.showImage.bounds.width, height: showImage.bounds.height))
       
        let img = render.image(actions: { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: self.showImage.bounds.width, height: self.showImage.bounds.height)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.blue.cgColor)
            ctx.cgContext.setLineWidth(12)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        })
        self.showImage.image = img
      
    }
    
    @IBAction func toSecond(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "sec")as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func draw(){
        
    }
    func currentImage()  {
          let render = UIGraphicsImageRenderer(size: CGSize(width: self.showImage.bounds.width, height: showImage.bounds.height))
                UIGraphicsBeginImageContext(CGSize(width: self.showImage.bounds.width, height: self.showImage.bounds.height))
        self.showImage.image?.draw(in: CGRect(x: 0, y: 0, width: self.showImage.bounds.width, height: self.showImage.bounds.height))
        let img = render.image(actions: { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: self.showImage.bounds.width, height: self.showImage.bounds.height)
            //ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.blue.cgColor)
            ctx.cgContext.setLineWidth(12)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        })
        self.showImage.image = img
    }

}

