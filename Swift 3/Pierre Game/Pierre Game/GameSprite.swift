//
//  GameSprite.swift
//  Pierre Game
//
//  Created by Lisa on 6/15/17.
//  Copyright © 2017 Sascha Luna. All rights reserved.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas : SKTextureAtlas { get set }
    var initialSize : CGSize { get set }
    func onTap()
}
