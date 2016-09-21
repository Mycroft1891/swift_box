import SpriteKit

class Player: SKSpriteNode, GameSprite {
    
    var textureAtlas:SKTextureAtlas = SKTextureAtlas(named: "pierre.atlas");
    var flyAnimation = SKAction();
    var soarAnimation = SKAction();
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 64, height: 64)) {
        
        parentNode.addChild(self);
        createAnimation();
        self.size = size;
        self.position = position;
        
        self.runAction(flyAnimation, withKey: "flapAnimation");
        
        let bodyTexture = textureAtlas.textureNamed("pierre-flying-3.png");
        
        self.physicsBody = SKPhysicsBody(texture: bodyTexture, size: size);
        self.physicsBody?.linearDamping = 0.9;
        self.physicsBody?.mass = 30;
        self.physicsBody?.allowsRotation = false;
        
    }
    
    func createAnimation() {
        
        let rotationUpAction = SKAction.rotateToAngle(0, duration: 0.475);
        rotationUpAction.timingMode = .EaseIn;
        
        let rotaionDownAction = SKAction.rotateToAngle(-1, duration: 0.8);
        rotaionDownAction.timingMode = .EaseIn;
        
        let flyFrames:[SKTexture] = [
            textureAtlas.textureNamed("pierre-flying-1.png"),
            textureAtlas.textureNamed("pierre-flying-2.png"),
            textureAtlas.textureNamed("pierre-flying-3.png"),
            textureAtlas.textureNamed("pierre-flying-4.png")
        ];
        
        let flyAction = SKAction.animateWithTextures(flyFrames, timePerFrame: 0.03);
        flyAnimation = SKAction.group([SKAction.repeatActionForever(flyAction), rotationUpAction]);
        
        let soarFrames:[SKTexture] = [textureAtlas.textureNamed("pierre-flying-1")];
        let soarAction = SKAction.animateWithTextures(soarFrames, timePerFrame: 1);
        soarAnimation = SKAction.group([SKAction.repeatActionForever(soarAction), rotaionDownAction]);
    }
    
    func onTap() {  }
    
    func update() { }
}