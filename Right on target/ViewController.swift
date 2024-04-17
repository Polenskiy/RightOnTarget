//
//  ViewController.swift
//  Right on target
//
//  Created by Daniil Polenskii on 05.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    ///случайное значение которое отображается в label
    var number: Int = 0
    ///текущий раунд
    var round: Int = 1
    var points: Int = 0
    
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    //в данном методе производиться загрузка всех графических элементов
    //размещенных на сцене
    //Подходит чтобы создать графические элементы с помощью программного кода
    override func loadView() {
        super.loadView()
        print("loadView")
        view.addSubview(getButtonView())
    }
    
    //Вызывается сразу после загрузки всех графических элементов
    //и прекрасно подходит для того, чтобы внести финальные правки
    //перед выводом сцены на экран
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad - вид был загружен")
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretValue(newText: String(game.currentSecretValue))
    }
    
    //Вызывается перед тем, как графические элементы сцены
    //будут добавлены в иерархию графических элементов
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear - view появиться")
    }
    
    //вызывается перед тем как view нашего vc, разместит свои subviews.
    //Границы окончательно подсчитаны.
    //use cases: внесение изменений до того,
    //как вью выстроит иерархию своих subviews.
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }
    
    //Вызывается после того как окончательно были рассчитаны все размеры,
    //чтобы уведомить о том, что view нашего vc расставила все свои subviews.
    //use cases: обновление или перерасчет положения и размеров view
    //или выполнения других настроек, связанных с интерфейсом пользователя.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    //вызывается после того, как графические элементы сцены
    //добавлены в иерархию View
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear - view появилось")
    }
    
    //вызывается до удаления элементов сцены из иерархии view
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear - view исчезнет")
    }
    
    //вызывается после удаления элементов сцены из иерархии view
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printContent("viewDidDisappear - view исчезло")
    }
    
    deinit {
        print("deinit")
    }
    
    ///Думаю что должен переработать этот метод и сязать его с model
    @IBAction func checkNumber() {
        
        game.calculateScore(with: Int(slider.value))
        
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewGame()
        }
        updateLabelWithSecretValue(newText: String(game.currentSecretValue))
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func updateLabelWithSecretValue(newText: String) {
        label.text = newText
    }
    
    @objc func showNextScreen(_ sender: UIButton ) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    private func getButtonView() -> UIButton {
        let button = UIButton(frame: CGRect(x: 720, y: 300, width: 100, height: 50))
        button.setTitle("Настройки", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.setTitleColor(.yellow, for: .highlighted)
        button.layer.cornerRadius = 10
        
        button.addTarget(nil, action: #selector(showNextScreen(_:)), for: .touchUpInside)
        return button
    }
    
}

