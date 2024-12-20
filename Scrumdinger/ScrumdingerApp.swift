//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Guilherme Deluca on 17/12/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
