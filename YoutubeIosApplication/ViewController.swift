//
//  ViewController.swift
//  YoutubeIosApplication
//
//  Created by Shivam on 09/08/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate,ModelDelegate{
   
    
    
    @IBOutlet weak var tableView: UITableView!
    

    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //set itself as the datasource and the delegate
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.deligate = self
        
        model.getVedios()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //confirm that the video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //get a refernce to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //get a reference  to the detaile view controller
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.video = selectedVideo
    }
    
    //mark:- Model Delegate Metods
    
    func videoFetched(_ videos: [Video]) {
        //set the returned videos to our video property
        self.videos = videos
        
        //Refresh the tableview
        
        tableView.reloadData()
    }
    
    //mark - tableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //Configure the cell with the data
        //get the title for the video in question
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        //Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

