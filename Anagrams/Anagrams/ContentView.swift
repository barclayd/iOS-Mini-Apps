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
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showError = false
    
    let dogs = ["Nodster", "Tedster", "Rooster"]
    
    func isValidWord(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {
            wordError(title: "No word entered", message: "Please enter a word")
            return
        }
        guard isValidWord(word: answer) else {
            wordError(title: "Invalid word entered", message: "Word entered is not a valid word")
            return
        }
        guard wordNotAlreadyUsed(word: answer) else {
            wordError(title: "Word already used", message: "Word already exists within the list of entered words")
            return
        }
        guard allLettersExistInWord(word: answer) else {
            wordError(title: "Invalid word entered", message: "Not all letters of the entered word exist within the root word")
            return
        }
        usedWords.insert(answer.firstUppercased, at: 0)
        newWord = ""
    }
    
    func loadWords() {
        if let fileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                let words = fileContents.components(separatedBy: "\n")
                let word = words.randomElement()
                let trimmedWord = word?.trimmingCharacters(in: .whitespacesAndNewlines)
                rootWord = trimmedWord?.firstUppercased ?? "Applique"
            }
            return
        }
        fatalError("Could not load words.txt from bundle")
    }
    
    func wordNotAlreadyUsed(word: String) -> Bool {
        !usedWords.contains(word.firstUppercased)
    }
    
    func allLettersExistInWord(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func wordError(title: String, message: String) {
        errorTitle = "Error! \(title)"
        errorMessage = message
        showError = true
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
            .alert(isPresented: $showError, content: {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            })
        }
    }
}

extension StringProtocol {
    var firstUppercased: String {
        return prefix(1).capitalized + dropFirst()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
