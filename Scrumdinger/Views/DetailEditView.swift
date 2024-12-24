//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Guilherme Deluca on 20/12/24.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeename = ""

    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(
                        value: $scrum.lengthInMinutesAsDouble, in: 5...30,
                        step: 1
                    ) {
                        Text("Length")
                    }.accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }.onDelete { indicies in
                    scrum.attendees.remove(atOffsets: indicies)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeename)
                    Button(
                        action: {
                            withAnimation {
                                let attendee = DailyScrum.Attendee(name: newAttendeename)
                                scrum.attendees.append(attendee)
                                newAttendeename = ""
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .accessibilityLabel("Add attendee")
                        }.disabled(newAttendeename.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
