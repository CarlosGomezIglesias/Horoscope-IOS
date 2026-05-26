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
    
    @IBOutlet weak var favoriteMenuItem: UIBarButtonItem!
    
    let session = SessionManager()
    
    var isFavorite = false
    
    var horoscope: Horoscope!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = horoscope.name
        
        renderDetail(horoscope: horoscope)
        
        isFavorite = session.isFavoriteHoroscope(id: horoscope.id)
        setFavoriteIcon()
    }
    
    func setFavoriteIcon(){
        if (isFavorite){
            favoriteMenuItem.image = UIImage(systemName: "heart.fill")
        }else {
            favoriteMenuItem.image = UIImage(systemName: "heart")
        }
    }

    @IBAction func favoriteMenuClicked(_ sender: Any) {
        isFavorite = !isFavorite
        if (isFavorite){
            session.setFavoriteHoroscope(id: horoscope.id)
        }else {
            session.setFavoriteHoroscope(id: "")
        }
        setFavoriteIcon( )
    }
    @IBAction func shareMenuClicked(_ sender: Any) {
        let text = "esto es lo que te mando"
        
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
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
