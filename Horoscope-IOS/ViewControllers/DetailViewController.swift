//
//  DetailViewController.swift
//  Horoscope-IOS
//
//  Created by Tardes on 22/5/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameDetailLabel: UILabel!
    
    @IBOutlet weak var dateDetailLabel: UILabel!
    
    @IBOutlet weak var imageDetailLabel: UIImageView!
    var horoscope: Horoscope!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        
        renderDetail(horoscope: horoscope)
    }
    
    func renderDetail(horoscope: Horoscope){
        nameDetailLabel.text = horoscope.name
        dateDetailLabel.text = horoscope.dates
        imageDetailLabel.image = horoscope.getImage()
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
