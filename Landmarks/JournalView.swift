//
//  JournalView.swift
//  Landmarks
//
//  Created by Ashwin Charles on 12/5/24.
//

import SwiftUI

struct JournalView: View {
        @State private var journalEntry = "Enter your thoughts here..."
        @State private var entries: [String] = [] // save journal entries
        @State private var userEdited = false // checks if the user has written anything in the journal entry
        @State private var placeholder: String = "Enter your thoughts here..."
        
        func saveEntry() {
            if (journalEntry.isEmpty == false && journalEntry != "Enter your thoughts here...") { // checks if the journal entry has content to save
                entries.append(journalEntry)
                journalEntry = "" // return to clean slate after save button is pressed
            }
        }

        var body: some View {
            NavigationView {
                VStack {
                    // use texteditor so user can enter their response
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: self.$journalEntry)
                            .frame(height: 300)
                            .padding()
                            .border(Color.gray, width: 1)
                            .foregroundColor(self.journalEntry == placeholder ? .gray : .primary)
                            .cornerRadius(8)
                            .offset(y: 200)
                            .padding(.horizontal, 50)
                            .onTapGesture {
                                if(self.journalEntry != placeholder){
                                    journalEntry = ""
                                    userEdited = true
                                }
                            }
                    }

                    // save journal entry
                    Button(action: saveEntry) {
                        Text("Submit")
                            .font(.title2)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.purple)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                        
                    }
                    .padding(.top, 250)
                    // saved journal responses
                    List(entries, id: \.self) { entry in
                        Text(entry)
                            .padding()
                    }
                    //.padding(.top, 20)
                }
                // journal prompt
                .navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline) //
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Text("Write what you’re feeling. Include as much or as little detail as you’d like.")
                                        .font(.headline) // adjust font size
                                        .offset(y: 150) // move the title down
                                        .multilineTextAlignment(.center)
                                }
                            }
            }
        }
    }


    struct JournalView_Previews: PreviewProvider {
        static var previews: some View {
            JournalView()
        }
    }

#Preview {
    JournalView()
}
