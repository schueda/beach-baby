//
//  GameStateMachine.swift
//  Beach Baby
//
//  Created by André Schueda on 22/07/21.
//

import Foundation

enum GameState {
    case start
    case walkingLeftWeirdThing
    case walkingRightSeagulls
    case seeingWeirdThing
    case pokingWeirdThing
    case walkingLeftDog
    case playingWithDog
    case walkingLeftTired
    case digging
    case playingWithSand
    case sitting
    case running
    case walkingSlowly
    case walkingRight
    case walkingLeft
    case walkingRightShells
    case lookingShells
    
    var possibleActions: [GameAction] {
        switch self {
        case .start:
            return [.walkLeft, .walkRight]
        case .walkingLeftWeirdThing:
            return [.getNearWeirdThing, .keepWalking]
        case .walkingRightSeagulls:
            return [.run, .walkSlowly]
        case .seeingWeirdThing:
            return [.pokeWeirdThing, .keepWalking]
        case .pokingWeirdThing:
            return [.keepWalking]
        case .walkingLeftDog:
            return [.frightDog, .playWithDog]
        case .playingWithDog:
            return [.letDogGoAway]
        case .walkingLeftTired:
            return [.dig, .playWithSand]
        case .digging:
            return [.sit]
        case .playingWithSand:
            return [.sit]
        case .running:
            return [.keepWalking]
        case .walkingSlowly:
            return [.keepWalking]
        case .walkingRight:
            return [.sit, .keepWalking]
        case .walkingLeft:
            return [.keepWalking]
        case .walkingRightShells:
            return [.sit, .lookShells]
        case .lookingShells:
            return [.keepWalking]
        case .sitting:
            return []
        }
    }
    
    var text: String {
        switch self {
        case .start:
            return "Uma garotinha e seu cachorro"
        case .walkingLeftWeirdThing:
            return "Eles andam, há algo estranho no caminho"
        case .walkingRightSeagulls:
            return "Eles andam, há um grupo de gaivotas no caminho"
        case .seeingWeirdThing:
            return "Uma Água-Viva enorme e morta"
        case .pokingWeirdThing:
            return "Nada acontece, mas a textura é esquisita"
        case .walkingLeftDog:
            return "Os dois caminham pela areia. Um Vira-Lata caramelo anda na direção deles"
        case .playingWithDog:
            return "Os dois cachorros brincam na areia"
        case .walkingLeftTired:
            return "A garotinha e o cachorro continuam andando, mas parecem meio cansados"
        case .digging:
            return "Eles cavam"
        case .playingWithSand:
            return "A menina faz um castelo de areia"
        case .running:
            return "As gaivotas voam, mas logo retornam para continuar seu almoço"
        case .walkingSlowly:
            return "Três gaivotas comem um peixe enorme"
        case .walkingRight:
            return "A garota e o cachorro andam pela areia"
        case .walkingLeft:
            return "A garota e o cachorro andam pela areia"
        case .walkingRightShells:
            return "Os dois andam pela areia, há várias conchinhas pelo chão"
        case .lookingShells:
            return "Várias conchinhas de vários tamanhos e formatos"
        case .sitting:
            return "Eles não precisam fazer nada além de sentar, sentir o sol na pele, a areia nos dedos e olhar o mar"
        }
    }
    
    var imageName: String {
        switch self {
        case .start:
            return "start"
        case .walkingLeftWeirdThing:
            return "walkingLeftWeirdThing"
        case .walkingRightSeagulls:
            return "walkingRightSeagulls"
        case .seeingWeirdThing:
            return "seeingWeirdThing"
        case .pokingWeirdThing:
            return "pokingWeirdThing"
        case .walkingLeftDog:
            return "walkingLeftDog"
        case .playingWithDog:
            return "playingWithDog"
        case .walkingLeftTired:
            return "walkingLeft"
        case .digging:
            return "digging"
        case .playingWithSand:
            return "playingWithSand"
        case .running:
            return "running"
        case .walkingSlowly:
            return "walkingSlowly"
        case .walkingRight:
            return "walkingRight"
        case .walkingLeft:
            return "walkingLeft"
        case .walkingRightShells:
            return "walkingRight"
        case .lookingShells:
            return "lookingShells"
        case .sitting:
            return "sitting"
        }
    }
}

enum GameAction {
    case walkLeft
    case walkRight
    case getNearWeirdThing
    case keepWalking
    case pokeWeirdThing
    case frightDog
    case playWithDog
    case letDogGoAway
    case dig
    case playWithSand
    case sit
    case lookShells
    case walkSlowly
    case run
    
    var text: String {
        switch self {
        case .walkLeft:
            return "Andar para esquerda"
        case .walkRight:
            return "Andar para direita"
        case .getNearWeirdThing:
            return "Se aproximar da coisa estranha"
        case .keepWalking:
            return "Continuar andando"
        case .pokeWeirdThing:
            return "Cutucar com um graveto"
        case .frightDog:
            return "Espantar o outro cachorro"
        case .playWithDog:
            return "Brincar com o outro cachorro"
        case .letDogGoAway:
            return "Deixar o vira-lata ir embora"
        case .dig:
            return "Cavar um buraco"
        case .playWithSand:
            return "Fazer um castelo de areia"
        case .sit:
            return "Sentar na areia"
        case .lookShells:
            return "Olhar as conchinhas"
        case .walkSlowly:
            return "Andar devagar"
        case .run:
            return "Correr para assustar as gaivotas"
        }
    }
}

class GameStateMachine {
    var currentState: GameState
    
    func processAction(_ gameAction: GameAction) -> GameState {
        if currentState == .start {
            if gameAction == .walkRight {
                return .walkingRightSeagulls
            } else {
                return .walkingLeftWeirdThing
            }
        }
        
        if currentState == .walkingLeftWeirdThing {
            if gameAction == .getNearWeirdThing {
                return .seeingWeirdThing
            } else {
                return .walkingLeft
            }
        }
        
        if currentState == .walkingRightSeagulls {
            if gameAction == .run {
                return .running
            } else {
                return .walkingSlowly
            }
        }
        
        if currentState == .seeingWeirdThing {
            if gameAction == .pokeWeirdThing {
                return .pokingWeirdThing
            } else {
                return .walkingLeft
            }
        }
        
        if currentState == .pokingWeirdThing {
            return .walkingLeft
        }
        
        if currentState == .walkingLeftDog {
            if gameAction == .frightDog {
                return .walkingLeftTired
            } else {
                return .playingWithDog
            }
        }
        
        if currentState == .playingWithDog {
            return .walkingLeftTired
        }
        
        if currentState == .walkingLeftTired {
            if gameAction == .dig {
                return .digging
            } else {
                return .playingWithSand
            }
        }
        
        if currentState == .digging {
            return .sitting
        }
        
        if currentState == .playingWithSand {
            return .sitting
        }
        
        if currentState == .running {
            return .walkingRight
        }
        
        if currentState == .walkingSlowly {
            return .walkingRight
        }
        
        if currentState == .walkingRight {
            if gameAction == .keepWalking {
                return .walkingRightShells
            } else {
                return .sitting
            }
        }
        
        if currentState == .walkingLeft {
            return .walkingLeftDog
        }
        
        if currentState == .walkingRightShells {
            if gameAction == .lookShells {
                return .lookingShells
            } else {
                return .sitting
            }
        }
        
        if currentState == .lookingShells {
            return .walkingRight
        }
        
        return .sitting
    }
    
    init() {
        currentState = .start
    }
}
