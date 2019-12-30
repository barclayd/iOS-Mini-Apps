//
//  ContentView.swift
//  Anagrams
//
//  Created by Daniel Barclay on 30/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    let dogs = ["Nodster", "Tedster", "Rooster"]
    
    func checkSpellingOfWord(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let isValidWord = misspelledRange.location == NSNotFound
        return isValidWord
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {
            return
        }
        usedWords.insert(answer.firstCapitalized, at: 0)
        newWord = ""
    }
    
    func loadWords() {
        if let fileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                let words = fileContents.components(separatedBy: "\n")
                let word = words.randomElement()
                let trimmedWord = word?.trimmingCharacters(in: .whitespacesAndNewlines)
                rootWord = trimmedWord?.firstCapitalized ?? "Applique"
            }
            return
        }
        fatalError("Could not load words.txt from bundle")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                        .listStyle(GroupedListStyle())
                }
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: loadWords)
        }
    }
}

extension StringProtocol {
    var firstCapitalized: String {
        return prefix(1).capitalized + dropFirst()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
