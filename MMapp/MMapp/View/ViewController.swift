//
//  ViewController.swift
//  MMapp
//
//  Created by Shanay Save on 2021-11-26.
//

import UIKit

class ViewController: UIViewController {

    
    let imageView = UIImageView()
    let textView = PaddingLabel(withInsets: 5, 5, 5, 5)
    let slider = UISlider()
    let stackView = UIStackView()
    
    let playPauseButton = UIButton()
    let nxtTrackButton = UIButton()
    let prevTrackButton = UIButton()
    let playlistsButton = UIButton()
    let idkButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupImageView()
        setupButtons()
        setupSlider()
        setupTextView()
        
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false   //Lets you use auto layout programatically
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
                
        imageView.image = UIImage(named: "JinxTestImage.jpeg")

    }
    
    func setupSlider() {
        view.addSubview(slider)
        
        //********** ASK GABE ABOUT HOW TO AVOID THE HARDCODED 150 VALUE
        
//        slider.frame = CGRect.init(x: 5, y: view.safeAreaLayoutGuide.layoutFrame.size.height - 150, width: UIScreen.main.bounds.size.width - 10, height: 10)
        
        slider.setEdgeConstraints(bottom: stackView.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10))
        slider.heightAnchor.constraint(equalToConstant: 10).isActive = true
        slider.thumbTintColor = UIColor (displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
        
        slider.value = 0.5
        slider.tintColor = UIColor (displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
    }
    
    func setupTextView() {
        view.addSubview(textView)
        
//        textView.frame =  CGRect.init(x: 160.0, y: view.safeAreaLayoutGuide.layoutFrame.size.height - 195, width: 200.0, height: 30.0)
        
        textView.translatesAutoresizingMaskIntoConstraints = false   //Lets you use auto layout programatically
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: slider.topAnchor).isActive = true
//        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        textView.widthAnchor.constraint(equalToConstant: text).isActive = true
        

        
        textView.backgroundColor = UIColor (displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
        
        textView.text = "MainTitle MainTitle"
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 10
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 20)
    
        
        
    }
    
    func setupButtons () {
//        let buttonWidth = UIScreen.main.bounds.size.width / 5
        
        
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.addArrangedSubview(playPauseButton)
        stackView.addArrangedSubview(nxtTrackButton)
        stackView.addArrangedSubview(prevTrackButton)
        stackView.addArrangedSubview(playlistsButton)
        stackView.addArrangedSubview(idkButton)
        stackView.distribution = .fillEqually
        
        stackView.setEdgeConstraints(bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        playPauseButton.backgroundColor = .red
        nxtTrackButton.backgroundColor = .blue
        prevTrackButton.backgroundColor = .green
        playlistsButton.backgroundColor = .gray
        idkButton.backgroundColor = .black
        
        
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
