import UIKit



class ViewController: UIViewController {
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var remSeconds = 60
    var timer = Timer()
    var progressBarVal = 0.0
    var totalTime = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton)
    {
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        remSeconds = eggTimes[hardness]!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }
    @objc func updateCounter() {
        if remSeconds > 0
        {
            progressBar.progress = (Float(totalTime) - Float(remSeconds)) / Float(totalTime)
            print("\(remSeconds) seconds.")
            remSeconds -= 1
        }
        else
        {
            progressBar.progress = 1.0
            timer.invalidate()
            print("Countdown finished.")
            self.titleLabel.text = "Bitti güzelim..."
            
        }
    }
}
