//
//  VideoTableViewCell.swift
//  YoutubeIosApplication
//
//  Created by Shivam on 12/08/24.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
        
    @IBOutlet weak var titelLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        self.video = v
        //ensure that we have video
        guard self.video != nil else{
            return
        }
        
        //set title and date label
        self.titelLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //set the thumbnai
        guard self.video!.thumbnail != "" else{
            return
        }
        //check cache before downloding the data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            //set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Downlode the thumbnail
        let url = URL(string: self.video!.thumbnail)
        
        //get the shared url session object
        let session = URLSession.shared
        
        //create a data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                CacheManager.setVideoCache(url!.absoluteString, data!)
                
                if url!.absoluteString != self.video?.thumbnail{
                    
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async{
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
    }

}
