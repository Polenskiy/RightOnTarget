//
//  SecondViewController.swift
//  Right on target
//
//  Created by Daniil Polenskii on 07.02.2024.
//

import UIKit

class SecondViewController: UIViewController {

//    @IBAction func HideCurrentScene() {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    @objc func goBackToTheNextScreen(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func getBackButtonView() -> UIButton {
        let button = UIButton(frame: CGRect(x: 360, y: 160, width: 100, height: 50))
        button.setTitle("Go back", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        
        button.addTarget(nil, action: #selector(goBackToTheNextScreen(_:)), for: .touchUpInside)
        return button
    }
    
    
    //viewController вызывает этот метод, когда его текущее view еще равно nil.
    //use cases: подмена дефолтной вью на кастомную.
    override func loadView() {
        super.loadView()
        print("loadView SecondViewController")
        view.addSubview(getBackButtonView())
    }
    
    //вызывается всего раз за все время существования VC.
    //Вызов происходит, когда все необходимые вью загружены в память.
    //use cases: верстка UI или другие задачи, которые нужно сделать всего один раз.
    //метод вызывается до того, как будут определены границы вью
    //и установлена ориентация экрана.
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad SecondViewController")
    }
    
    //вызывается каждый раз перед тем, как вью станет видимым.
    //В этом методе вью уже имеет границы (bounds), но ориентация еще не задана.
    //use cases: обновление UI данными, которые могли измениться,
    //пока vс не отображался на экране.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear SecondViewController")
    }
    
    //вызывается перед тем как view нашего vc, разместит свои subviews.
    //Границы окончательно подсчитаны.
    //use cases: внесение изменений до того,
    //как вью выстроит иерархию своих subviews.
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews SeconViewController")
    }
    
    //Вызывается после того как окончательно были рассчитаны все размеры,
    //чтобы уведомить о том, что view нашего vc расставила все свои subviews.
    //use cases: обновление или перерасчет положения и размеров view
    //или выполнения других настроек, связанных с интерфейсом пользователя.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews SecondViewController")
    }
    
    //Вызывает после того, как вью появилась на экране.
    //use cases: старт анимации, начало воспроизведения видео или звука.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear SecondViewController")
    }
    
    //Вызывается когда vc начинает исчезать с экрана.
    //use cases: скрытие клавиатуры, отмена сетевых запросов,
    //возврат изменений в родительский контроллер. Кроме того,
    //это идеальное место для сохранения состояния
    //(сохранение того, что успел натыкать пользователь на экране, перед его закрытием).
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear SecondViewController")
        
    }
    
    //Вызывается, когда контроллер исчез с экрана и удален из иерархии views.
    //use cases: окончание анимации закрытия контроллера,
    //очистка заполненный полей, остановка аудио или видео контента.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear SecondViewController")
    }
    
    deinit {
        print("deinit")
    }

}
