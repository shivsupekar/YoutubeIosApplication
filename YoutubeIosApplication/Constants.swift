

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyAzkipXO1MJRpsdygQsBfIB38vLK1wSQ34"
    static var PLAYLIST_ID = "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua"  // Replace with your actual Playlist ID
    static var API_URL: String {
        return "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    }
}

