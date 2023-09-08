import UIKit
import YoutubePlayer_in_WKWebView

class DetailViewController: UIViewController {
    let video: Video
    var playerView: WKYTPlayerView!
    
    init(video: Video) {
        self.video = video
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView = WKYTPlayerView(frame: view.bounds)
        view.addSubview(playerView)
        
        playerView.load(withVideoId: video.id)
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 20, width: view.bounds.width - 40, height: 40))
        titleLabel.text = video.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
    }
}
