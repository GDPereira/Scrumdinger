//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Guilherme Deluca on 18/12/24.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List(scrums, id: \.title) {
            scrum in
            CardView(scrum: scrum).listRowBackground(scrum.theme.mainColor)
        }
    }
}

struct ScrusmView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
