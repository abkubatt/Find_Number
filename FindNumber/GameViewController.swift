import UIKit

class GameViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nextDigit: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    lazy var game = Game(countItems: buttons.count, time: 30){[weak self] (status, time) in
        
        guard let self = self else {return}
        
        self.timerLabel.text = time.secondsToString()
        self.updateInfoGame(with: status)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(index: buttonIndex)
        updateUI()
    }
    
    @IBAction func newGame(_ sender: Any) {
    }
    
    private func setupScreen(){
        for index in game.items.indices{
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].isHidden = false
        }
        
        nextDigit.text = game.nextItem?.title
    }
    
    private func updateUI(){
        for index in game.items.indices{
            buttons[index].isHidden = game.items[index].isFound
            
            if game.items[index].isError{
                UIView.animate(withDuration: 0.3) {[weak self] in
                    self?.buttons[index].backgroundColor = .red
                }completion: { [weak self] (_) in
                    self?.buttons[index].backgroundColor = .white
                    self?.game.items[index].isError = false
                }
            }
        }
        nextDigit.text = game.nextItem?.title
        
        updateInfoGame(with: game.status)
    }
    
    private func updateInfoGame(with status: StatusGame){
        switch status{
        case .start:
            statusLabel.text = "Игра началась"
            statusLabel.textColor = .black
        case .win:
            statusLabel.text = "Вы выйграли"
            statusLabel.textColor = .green
        case .lose:
            statusLabel.text = "Вы проиграли"
            statusLabel.textColor = .red
        }
    }
    
    
    
}

extension Int{
    func secondsToString()->String{
        let minutes = self / 60
        let seconds = self % 60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
}
