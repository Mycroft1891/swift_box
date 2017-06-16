// import the framework
import CoreMotion

// instantiate it
var motionManager = CMMotionManager()

// set it up for polling
override func didMove(to view: SKView) {        
        self.motionManager.startAccelerometerUpdates()
    }

// get a value in the update function
    override func update(_ currentTime: TimeInterval) {
        player.update()
        
        guard let accelData = self.motionManager.accelerometerData else { return }
            var forceAmount : CGFloat
            var movement  = CGVector()
        
            switch UIApplication.shared.statusBarOrientation {
                case .landscapeLeft:
                    forceAmount = 20000
                case .landscapeRight:
                    forceAmount = -20000
                default:
                    forceAmount = 0
            }
            
            if accelData.acceleration.y > 0.15 {
                movement.dx = forceAmount
            } else if accelData.acceleration.y < -0.15 {
                movement.dx = -forceAmount
            }
            
            player.physicsBody?.applyForce(movement)
    }