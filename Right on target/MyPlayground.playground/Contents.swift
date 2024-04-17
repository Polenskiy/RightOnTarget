//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class ViewController: UIViewController {
    
    ///случайное значение которое отображается в label
    var number: Int = 0
    ///текущий раунд
    var round: Int = 1
    var points: Int = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
//    lazy var secondViewController = getSecondViewController()
//
//    func getSecondViewController() -> SecondViewController {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
//        return viewController as! SecondViewController
//    }
    
//    @IBAction func showNextScreen() {
//        self.present(secondViewController, animated: true, completion: nil)
//    }
    
    
    ///Думаю что должен переработать этот метод и сязать его с model
    @IBAction func checkNumber() {
        
            let numSlider = Int(self.slider.value.rounded())
            
            if self.number > numSlider {
                self.points += 50 - self.number + numSlider
            } else if self.number < numSlider {
                self.points += 50 - numSlider + self.number
            } else {
                self.points += 50
            }
        
        if self.round == 5 {
            let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(self.number) очков" , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    
    //тепреь нужно как-то реализовать обратный возврат слайдера на место
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

}



// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
