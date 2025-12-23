//


import SwiftSM


let appReducer = Reducer<AppState, AppAction>(id: "AppReducer") { state, action in
  switch action {
  case .add(let amount):
    state.count += amount
  case .increment:
    state.count += 1
  case .setValue(let value):
    state.count = value
  }
}
