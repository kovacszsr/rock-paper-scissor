//
//  Sign.swift
//  RPS
//
//  Created by Kovács Zsófia Ramóna on 2023. 09. 19..
//

import Foundation

enum Sign {
    case rock
    case paper
    case scissor
    
    var emoji: String {
        
        switch self {
            case .rock: return "👊"
            case .paper: return "🖐️"
            case .scissor: return "✌️"
        }
    }
    
    func game(_ otherSign: Sign) -> GameState {
        
        switch self {
        case .rock:
            if otherSign == .rock {return .draw}
            else if otherSign == .paper {return .lose}
    //            if otherSign == .scissor {return .win}
            else {return .win}
            
        case .paper:
            if otherSign == .rock {return .win}
            else if otherSign == .paper {return .draw}
    //            if otherSign == .scissor {return .lose}
            else {return .lose}
            
        case .scissor:
            if otherSign == .rock {return .lose}
            else if otherSign == .paper {return .win}
    //            if otherSign == .scissor {return .draw}
            else {return .draw}
            
        }
    }


}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return.paper
    } else {
        return .scissor
    }
}

