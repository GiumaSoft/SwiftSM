

import Observation
import SwiftSM


@MainActor
@Observable
final class AppState: ReduxState {

  var count: Int
  
  init(count: Int) {
    self.count = count
  }
  
  convenience init() {
    self.init(
      count: 0
    )
  }

  var readOnly: ReadOnlyAppState {
    ReadOnlyAppState(self)
  }
}

extension AppState {
  @MainActor
  final class ReadOnlyAppState: ReadOnlyState {
    private unowned let state: AppState
    init(_ state: AppState) {
      self.state = state
    }
  }
}

extension AppState.ReadOnlyAppState {
  var count: Int { state.count }
}

