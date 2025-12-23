//


import SwiftSM


let appMiddleware = Middleware<AppState, AppAction>(id: "appMiddleware") { context in
  let (_, _, next, action) = context
  
  switch action {
  case .add(let amount):
    _ = amount
  case .increment:
    break
  case .setValue(let value):
    _ = value
  }
  
  try next(action)
}
