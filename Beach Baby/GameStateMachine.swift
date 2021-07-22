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
            return [.walkLeft, .walkRight]
        default:
            return []
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
    
}

class GameStateMachine {
    var currentState: GameState
    
    func processAction(_ gameAction: GameAction) -> GameState {
        if currentState == .start {
            if gameAction == .walkRight {
                return .walkingLeft
            } else {
                return .walkingRight
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
            return .sitting
        }
        
        return .sitting
    }
    
    init() {
        currentState = .start
    }
}
