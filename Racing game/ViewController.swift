

import UIKit

class ViewController: UIViewController {
    
    private var viewRoad = UIView()
    private var viewRoadColour: UIColor = .systemGray
    
    private var leftRoadside = UIView()
    private var rightRoadside = UIView()
    private var roadsideColour: UIColor = .yellow    // roadsides colour
    private var roadsideWidthProportion: CGFloat = 7 // value of proportion from superview width
    
    var roadMark = UIView()
    private var roadMark2 = UIView()
    private var roadMark3 = UIView()
    private var roadmarkColour: UIColor = .white     // roadmark colour
    private var roadmarkWidthProportion: CGFloat = 50 // value of proportion from superview width
    private var roadmarkHeightProportion: CGFloat = 5 // value of proportion from superview height
    private var vehicleWidthProportion: CGFloat = 8 // value of proportion from superview width
    private var vehicleCrossProportion: CGFloat = 2 // value of proportion from vehicle width
    
    
    private var imageVehicle = UIImageView()
    
    private var imageObstruction = UIImageView()
    private var imageObstruction2 = UIImageView()
    private var imageObstruction3 = UIImageView()
    private var roadsideOdject = UIImageView()
    private var roadsideOdject2 = UIImageView()
    private var roadsideOdject3 = UIImageView()
    private var roadsideObject4 = UIImageView()
    private var roadsideDanger = UIImageView()
    private var boom = UIImageView()
    
    
    private var buttonLeft = UIButton()
    private var buttonRight = UIButton()
    
    private var timerObstruction: Timer?
    private var timerObstruction2: Timer?
    private var timerObstruction3: Timer?
    private var timerRoadmark: Timer?
    private var timerRoadsideOdject: Timer?
    private var timerRoadsideOdject2: Timer?
    private var timerRoadsideOdject3: Timer?
    private var timerRoadsideOdject4: Timer?
    private var timerRoadsideDanger: Timer?
    private var intersectionCheckTimer: Timer?
    private var gameOver: Timer?
    private var timerGameTime: Timer?
    
    private var labelLeft: UILabel!
    private var labelRight: UILabel!
    var userName: String! = "no name"
    var userDistance: String! = "0"
    var userTime: String! = "0"
    var userDate: String! = ""
    var countSec: Int = 0
    lazy private var dateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        //        let animator = UIViewPropertyAnimator(duration: 3, curve: .linear) {
        //            self..transform = CGAffineTransform(translationX: 0, y: - 500)
        //
        //        }
        //        animator.startAnimation()
        
        setupGameScreen()
        //        viewRoadAnimation()
        setGameDifficulty()
        
        intersectionCheckTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(intersectionCheck), userInfo: nil, repeats: true)
        timerGameTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimeOfGame), userInfo: nil, repeats: true)
    }
    
    private func setupGameScreen() {
        
        viewRoad.frame = UIScreen.main.bounds
        viewRoad.backgroundColor = viewRoadColour
        view.addSubview(viewRoad)
        
        addRoadmarks(name: roadMark)
        addRoadmarks(name: roadMark2)
        addRoadmarks(name: roadMark3)
        
        
        
        leftRoadside.frame = CGRect(x: view.bounds.minX,
                                    y: view.bounds.minY,
                                    width: view.bounds.maxX / roadsideWidthProportion,
                                    height: view.bounds.height)
        leftRoadside.backgroundColor = roadsideColour
        view.addSubview(leftRoadside)
        
        
        rightRoadside.frame = CGRect(x: view.bounds.maxX - view.bounds.maxX / roadsideWidthProportion,
                                     y: view.bounds.minY,
                                     width: view.bounds.maxX / roadsideWidthProportion,
                                     height: view.bounds.height)
        rightRoadside.backgroundColor = roadsideColour
        view.addSubview(rightRoadside)
        
        
        imageObstruction.image = setObstruction()
        imageObstruction.frame = CGRect(x: view.bounds.minX + view.bounds.maxX / 4,
                                        y: view.bounds.minY - 100,
                                        width: 80,
                                        height: 60)
        imageObstruction.dropShadow()
        imageObstruction.image = setObstruction()
        view.addSubview(imageObstruction)
        
        
        imageObstruction2.frame = CGRect(x: view.bounds.minX + view.bounds.maxX / 2.5 ,
                                         y: view.bounds.minY - 100,
                                         width: 70,
                                         height: 55)
        imageObstruction2.dropShadow()
        imageObstruction2.image = setObstruction()
        view.addSubview(imageObstruction2)
        
        
        imageObstruction3.frame = CGRect(x: view.bounds.minX + view.bounds.maxX / 1.5 ,
                                         y: view.bounds.minY - 100,
                                         width: 60,
                                         height: 50)
        imageObstruction3.dropShadow()
        imageObstruction3.image = setObstruction()
        view.addSubview(imageObstruction3)
        
        
        roadsideOdject.image = UIImage(named: "palm")
        roadsideOdject.frame = CGRect(x: view.bounds.minX + view.bounds.maxX / roadmarkWidthProportion ,
                                      y: view.bounds.minY - 100,
                                      width: 50,
                                      height: 55)
        view.addSubview(roadsideOdject)
        
        roadsideOdject2.image = UIImage(named: "palm")
        roadsideOdject2.frame = CGRect(x: view.bounds.maxX - view.bounds.maxX / 8 ,
                                       y: view.bounds.minY - 100,
                                       width: 50,
                                       height: 55)
        view.addSubview(roadsideOdject2)
        
        roadsideOdject3.image = UIImage(named: "sign_one")
        roadsideOdject3.frame = CGRect(x: view.bounds.maxX - view.bounds.maxX / 8 ,
                                       y: view.bounds.minY - 100,
                                       width: 50,
                                       height: 55)
        view.addSubview(roadsideOdject3)
        
        
        roadsideObject4.image = UIImage(named: "sign_two")
        roadsideObject4.frame = CGRect(x: view.bounds.minX + view.bounds.maxX / roadmarkWidthProportion,
                                       y: view.bounds.minY - 100,
                                       width: 50,
                                       height: 55)
        view.addSubview(roadsideObject4)
        
        roadsideDanger.image = UIImage(named: "kangaroo")
        roadsideDanger.frame = CGRect(x: view.bounds.maxX - view.bounds.maxX / 8,
                                      y: view.bounds.minY - 100,
                                      width: 80,
                                      height: 70)
        
        view.addSubview(roadsideDanger)
        
        boom.image = UIImage(named: "boom")
        
        buttonLeft.frame = CGRect(x: 0, y: view.bounds.midY, width: view.bounds.maxY / 2, height: view.bounds.maxX)
        buttonLeft.backgroundColor = .clear
        buttonLeft.addTarget(self, action: #selector(moveCarLeft), for: .touchUpInside)
        view.addSubview(buttonLeft)
        
        buttonRight.frame = CGRect(x: view.bounds.maxX / 2, y: view.bounds.midY, width: view.bounds.maxY / 2, height: view.bounds.maxX)
        buttonRight.backgroundColor = .clear
        buttonRight.addTarget(self, action: #selector(moveCarRight), for: .touchUpInside)
        view.addSubview(buttonRight)
        
        
        imageVehicle.frame = CGRect(x: view.bounds.midX - 30,
                                    y: view.bounds.maxY - 150,
                                    width: view.bounds.maxX / vehicleWidthProportion,
                                    height: view.bounds.maxX / vehicleWidthProportion * vehicleCrossProportion)
        imageVehicle.image = setVehicle()
        view.addSubview(imageVehicle)
        
        
        labelLeft = UILabel()
        labelLeft.frame = CGRect(x: view.bounds.minX + 70,
                                 y: view.bounds.minY + 50,
                                 width: 140,
                                 height: 100)
        
        labelLeft.text = "USER:" + userName
        labelLeft.textAlignment = .left
        view.addSubview(labelLeft)
        
        labelRight = UILabel()
        labelRight.frame = CGRect(x: view.bounds.minX + 230,
                                  y: view.bounds.minY + 50,
                                  width: 140,
                                  height: 100)
        labelRight.textAlignment = .left
        view.addSubview(labelRight)
        
        
        
    }
    func addRoadmarks (name: UIView) {
        
        name.frame = CGRect(x: (view.bounds.midX - (view.bounds.maxX / roadmarkWidthProportion) / 2),
                            y: (view.bounds.minY - view.bounds.maxY / roadmarkHeightProportion),
                            width: view.bounds.maxX / roadmarkWidthProportion,
                            height: view.bounds.maxY / roadmarkHeightProportion)
        name.backgroundColor = roadmarkColour
        view.addSubview(name)
    }
    
    
    func setVehicle() -> UIImage {
        var imageTransport = UIImage()
        let speedSegmentedControl = UserDefaults.standard.integer(forKey: "vehicle")
        switch speedSegmentedControl {
        case 0:                              // sport
            let image = UIImage(named: "sport car")
            imageTransport = image!
        case 1:                              // police
            let image = UIImage(named: "police car")
            imageTransport = image!
        case 2:                              // truck
            let image = UIImage(named: "truck")
            imageTransport = image!
        default:
            break
        }
        return imageTransport
    }
    
    func setObstruction() -> UIImage {
        var imageAbsraction = UIImage()
        let speedSegmentedControl = UserDefaults.standard.integer(forKey: "obstruction")
        switch speedSegmentedControl {
        case 0:                              // stone
            let image = UIImage(named: "stone")
            imageAbsraction = image!
        case 1:                              // blockpost
            let image = UIImage(named: "blockpost")
            imageAbsraction = image!
        default:
            break
        }
        return imageAbsraction
    }
    
    private func setGameDifficulty() {
        let speedSegmentedControl = UserDefaults.standard.integer(forKey: "difficulty")
        switch speedSegmentedControl {
        case 0:                              // easy
            easyModeTimer()
        case 1:                              // medium
            mediumModeTimer()
        case 2:                              // hard
            hardModeTimer()
        default:
            break
        }
    }
    
    private func easyModeTimer () {
        timerRoadmark = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(viewRoadAnimation), userInfo: nil, repeats: false)
        
        timerRoadsideOdject = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject), userInfo: nil, repeats: false)
        timerRoadsideOdject2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject2), userInfo: nil, repeats: false)
        timerRoadsideOdject3 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject3), userInfo: nil, repeats: false)
        timerRoadsideOdject4 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject4), userInfo: nil, repeats: false)
        
        //        timerRoadsideDanger = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideDanger), userInfo: nil, repeats: false)
        
        timerObstruction = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveObstruction), userInfo: nil, repeats: false)
        timerObstruction2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveObstruction2), userInfo: nil, repeats: false)
        //        timerObstruction3 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveObstruction3), userInfo: nil, repeats: false)
    }
    private func mediumModeTimer () {
        timerRoadmark = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(viewRoadAnimation), userInfo: nil, repeats: false)
        
        timerRoadsideOdject = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject), userInfo: nil, repeats: false)
        timerRoadsideOdject2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject2), userInfo: nil, repeats: false)
        timerRoadsideOdject3 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject3), userInfo: nil, repeats: false)
        timerRoadsideOdject4 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject4), userInfo: nil, repeats: false)
        
        //        timerRoadsideDanger = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideDanger), userInfo: nil, repeats: false)
        
        timerObstruction = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveObstruction), userInfo: nil, repeats: false)
        timerObstruction2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveObstruction2), userInfo: nil, repeats: false)
        //        timerObstruction3 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveObstruction3), userInfo: nil, repeats: false)
    }
    private func hardModeTimer () {
        timerRoadmark = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(viewRoadAnimation), userInfo: nil, repeats: false)
        
        timerRoadsideOdject = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject), userInfo: nil, repeats: false)
        timerRoadsideOdject2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject2), userInfo: nil, repeats: false)
        timerRoadsideOdject3 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject3), userInfo: nil, repeats: false)
        timerRoadsideOdject4 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideObject4), userInfo: nil, repeats: false)
        
        timerRoadsideDanger = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveRoadsideDanger), userInfo: nil, repeats: false)
        
        timerObstruction = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveObstruction), userInfo: nil, repeats: false)
        timerObstruction2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveObstruction2), userInfo: nil, repeats: false)
        timerObstruction3 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(moveObstruction3), userInfo: nil, repeats: false)
    }
    private func setResultDate () {
        let time = NSDate()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        userDate = dateFormatter.string(from: time as Date)
        
    }
    
    private func saveResults() {
        let user = Results(name: userName, time: userTime, distance: userDistance, date: userDate)
        let data = try? JSONEncoder().encode(user)
        UserDefaults.standard.set(data, forKey: "someUser")
    }
    private func showResults() {
        let savedData = UserDefaults.standard.value(forKey: "someUser")
        if let savedData = savedData as? Data {
            let savedUser = try? JSONDecoder().decode(Results.self, from: savedData)
            print(savedUser)
            
        }
    }
    
    @objc private func stopAction () {
        self.dismiss(animated: true)
        setResultDate()
        saveResults()
        
//                showResults()
        //        print(userName, userDistance, userTime, userDate)
    }
    
    @objc private func viewRoadAnimation() {
        
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .curveLinear]) {
            self.roadMark.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + self.roadMark.bounds.maxY)
        } completion: { _ in
            self.roadMark.transform = .identity
        }
        
        UIView.animate(withDuration: 3, delay: 1, options: [ .repeat, .curveLinear]) {
            self.roadMark2.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + self.roadMark2.bounds.maxY)
        } completion: { _ in
            self.roadMark2.transform = .identity
        }
        
        UIView.animate(withDuration: 3, delay: 2, options: [ .repeat, .curveLinear]) {
            self.roadMark3.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + self.roadMark3.bounds.maxY)
        } completion: { _ in
            self.roadMark3.transform = .identity
        }
    }
    @objc private func moveCarLeft() {
        
        if !imageVehicle.frame.origin.x.isLess(than: view.frame.minX) {
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.imageVehicle.center.x -= self.imageVehicle.bounds.width/3
            }
        } else {
            self.imageVehicle.center.x = self.imageVehicle.center.x
        }
    }
    @objc private func moveCarRight() {
        if imageVehicle.frame.origin.x.isLess(than: view.frame.maxX - imageVehicle.frame.width) {
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.imageVehicle.center.x += self.imageVehicle.bounds.width/3
            }
        } else {
            self.imageVehicle.center.x = self.imageVehicle.center.x
        }
    }
    @objc private func moveObstruction() {
        UIView.animate(withDuration: 2.7, delay: 2, options: [.repeat, .curveLinear]) {
            self.imageObstruction.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + 111)
        } completion: { _ in
            self.imageObstruction.transform = .identity
        }
    }
    @objc private func moveObstruction2() {
        UIView.animate(withDuration: 2.7, delay: 6, options: [ .repeat, .curveLinear]) {
            self.imageObstruction2.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + 111)
        } completion: { _ in
            self.imageObstruction2.transform = .identity
        }
    }
    @objc private func moveObstruction3() {
        UIView.animate(withDuration: 2.7, delay: 8, options: [ .repeat, .curveLinear]) {
            self.imageObstruction3.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + 111)
        } completion: { _ in
            self.imageObstruction3.transform = .identity
        }
    }
    @objc private func moveRoadsideObject() {
        
        UIView.animate(withDuration: 3, delay: 1, options: [ .repeat, .curveLinear]) {
            self.roadsideOdject.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + self.roadsideOdject.bounds.maxY + 50)
        } completion: { _ in
            self.roadsideOdject.transform = .identity
        }
        
    }
    @objc private func moveRoadsideObject2() {
        
        UIView.animate(withDuration: 3, delay: 1, options: [ .repeat, .curveLinear]) {
            self.roadsideOdject2.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + self.roadsideOdject2.bounds.maxY + 50)
        } completion: { _ in
            self.roadsideOdject2.transform = .identity
        }
    }
    @objc private func moveRoadsideObject3() {
        
        UIView.animate(withDuration: 3, delay: 2.5, options: [ .repeat, .curveLinear]) {
            self.roadsideOdject3.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + self.roadsideOdject3.bounds.maxY + 50)
        } completion: { _ in
            self.roadsideOdject3.transform = .identity
        }
    }
    @objc private func moveRoadsideObject4() {
        UIView.animate(withDuration: 3, delay: 2.5, options: [ .repeat, .curveLinear]) {
            self.roadsideObject4.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + self.roadsideObject4.bounds.maxY + 50)
        } completion: { _ in
            self.roadsideObject4.transform = .identity
        }
    }
    @objc private func moveRoadsideDanger() {
        
        UIView.animate(withDuration: 3, delay: 3, options: [ .repeat, .curveLinear]) {
            self.roadsideDanger.transform = CGAffineTransform(translationX: self.view.bounds.midX - self.view.bounds.maxX, y: self.view.bounds.maxY + 70)
        } completion: { _ in
            self.roadsideDanger.transform = .identity
        }
    }
    @objc private func countTimeOfGame() {
        countSec += 1
        userTime = String(countSec)
        userDistance = String(countSec * 25)
        
        guard let time = userTime,
              let distance = userDistance
        else {
            return
        }
        labelRight.text = time + "sec.," + distance + "met."
    }
    @objc private func intersectionCheck() {
        guard       let imageCar = self.imageVehicle.layer.presentation(),
                    let imageStone = self.imageObstruction.layer.presentation(),
                    let imageStone1 = self.imageObstruction2.layer.presentation(),
                    let imageStone2 = self.imageObstruction3.layer.presentation(),
                    let imageDanger = self.roadsideDanger.layer.presentation(),
                    let imageRoadside = self.leftRoadside.layer.presentation(),
                    let imageRoadside2 = self.rightRoadside.layer.presentation()
        else {
            return
        }
        
        
        if  imageStone.frame.intersects(imageCar.frame.insetBy(dx: 20, dy: 5)) ||
                imageStone1.frame.intersects(imageCar.frame.insetBy(dx: 20, dy: 5)) ||
                imageStone2.frame.intersects(imageCar.frame.insetBy(dx: 20, dy: 5)) ||
                imageDanger.frame.intersects(imageCar.frame.insetBy(dx: 20, dy: 5)) ||
                imageRoadside.frame.intersects(imageCar.frame.insetBy(dx: 20, dy: 5)) ||
                imageRoadside2.frame.intersects(imageCar.frame.insetBy(dx: 20, dy: 5))
        {
            boom.frame = CGRect(x: imageCar.frame.origin.x,
                                y: imageVehicle.frame.origin.y - 30 ,
                                width: self.imageVehicle.frame.width + 90,
                                height: self.imageVehicle.frame.height + 70)
            view.addSubview(boom)
            
            imageVehicle.removeFromSuperview()
            imageObstruction.removeFromSuperview()
            imageObstruction2.removeFromSuperview()
            imageObstruction3.removeFromSuperview()
            roadsideDanger.removeFromSuperview()
            //            roadMark.removeFromSuperview()
            //            roadMark2.removeFromSuperview()
            //            roadMark3.removeFromSuperview()
            //            roadsideOdject.removeFromSuperview()
            //            roadsideOdject2.removeFromSuperview()
            //            roadsideOdject3.removeFromSuperview()
            //            roadsideObject4.removeFromSuperview()
            
            
            
            intersectionCheckTimer?.invalidate()
            
            timerRoadmark?.invalidate()
            timerRoadsideOdject?.invalidate()
            timerRoadsideOdject2?.invalidate()
            timerRoadsideOdject3?.invalidate()
            timerRoadsideOdject4?.invalidate()
            timerRoadsideDanger?.invalidate()
            
            gameOver = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stopAction), userInfo: nil, repeats: false)
            
        }
    }
}
