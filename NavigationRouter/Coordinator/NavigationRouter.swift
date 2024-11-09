//
//  NavigationRouter.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    @Published var routes = [Route]()

    func push(to screen: Route) {
        routes.append(screen)
    }

    func reset() {
        routes = []
    }

    func navigateBack() {
        _ = routes.popLast()
    }
}
