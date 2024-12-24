//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Guilherme Deluca on 18/12/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]

    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }.navigationTitle("Daily Scrums").toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }.accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrusmView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData))
    }
}
