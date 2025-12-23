

import Testing
@testable import SwiftSM

@MainActor
struct ReduxTests {
  @Test func dispatchUpdatesState() {
    let store = Store<AppState, AppAction>(
      initialState: AppState(),
      middlewares: [],
      reducers: [ appReducer ],
      onLog: { message in
        print(message)
      }
    )
    
    store.dispatch(.increment)
    store.dispatch(.add(3))
    
    #expect(store.state.count == 4)
  }

  @Test func reducersRunInOrder() {
    let first = Reducer<AppState, AppAction>(id: "First") { state, _ in
      state.count = 1
    }
    let second = Reducer<AppState, AppAction>(id: "Second") { state, _ in
      state.count = 2
    }
    
    let store = Store<AppState, AppAction>(
      initialState: AppState(),
      middlewares: [],
      reducers: [ first, second ],
      onLog: { message in
        print(message)
      }
    )
    
    store.dispatch(.increment)
    
    #expect(store.state.count == 2)
  }

  @Test func appMiddlewarePassesThrough() {
    let store = Store<AppState, AppAction>(
      initialState: AppState(),
      middlewares: [ appMiddleware ],
      reducers: [ appReducer ]
    )

    store.dispatch(.add(2))

    #expect(store.state.count == 2)
  }

  @Test func appMiddlewareProcessesIncrement() {
    let store = Store<AppState, AppAction>(
      initialState: AppState(),
      middlewares: [ appMiddleware ],
      reducers: [ appReducer ]
    )

    store.dispatch(.increment)

    #expect(store.state.count == 1)
  }
}
