

import SwiftSM


enum AppAction: ReduxAction {
  case add(Int)
  case increment
  case setValue(Int)
  
  var id: Int {
    switch self {
    case .add: 10
    case .increment: 20
    case .setValue: 30
    }
  }
  
  var description: String {
    switch self {
    case .add: "add"
    case .increment: "increment"
    case .setValue: "setValue"
    }
  }
  
  var debugDescription: String {
    switch self {
    case .add(let amount): "add(\(amount))"
    case .setValue(let value): "setValue(\(value)"
    default:
      description
    }
  }
}
