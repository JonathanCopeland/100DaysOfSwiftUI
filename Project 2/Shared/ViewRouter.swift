//
//  ViewRouter.swift
//  GuessTheFlag
//
//  Created by Jonathan Copeland on 2020/12/27.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .GameView
}
