//
//  ContentView.swift
//  Anagrams
//
//  Created by Daniel Barclay on 30/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var words = [String]()
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showError = false
    
    func isValidWord(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {
            displayAlert(title: "No word entered", message: "Please enter a word")
            return
        }
        guard rootWord.lowercased() != answer.lowercased() else {
            displayAlert(title: "Invalid anagram", message: "Looks like you've just copied the root word. Try and be a little more original next time...")
            return
        }
        guard isValidWord(word: answer) else {
            displayAlert(title: "Invalid word entered", message: "Word entered is not a valid word")
            return
        }
        guard wordNotAlreadyUsed(word: answer) else {
            displayAlert(title: "Word already used", message: "Word already exists within the list of entered words")
            return
        }
        guard allLettersExistInWord(word: answer) else {
            displayAlert(title: "Invalid word entered", message: "Not all letters of the entered word exist within the root word")
            return
        }
        usedWords.insert(answer.firstUppercased, at: 0)
        newWord = ""
    }
    
    func loadWords() {
        if let fileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                words = fileContents.components(separatedBy: "\n")
                generateNewWord()
                
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
    
    func displayAlert(title: String, message: String, error: Bool = true) {
        errorTitle = error ? "Error! \(title)" : title
        errorMessage = message
        showError = true
    }
    
    func skipWord() {
        displayAlert(title: "On to the next word!", message: "You got \(usedWords.count) anagrams for \(rootWord). Here's hoping you'll get more for the next word 😉", error: false)
        generateNewWord()
    }
    
    func generateNewWord() {
        let word = words.randomElement()
        let trimmedWord = word?.trimmingCharacters(in: .whitespacesAndNewlines)
        rootWord = trimmedWord?.firstUppercased ?? "Applique"
        usedWords.removeAll()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord).textFieldStyle(RoundedBorderTextFieldStyle())
                    .modifier(ClearButton(text: $newWord))
                    .padding()
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                        .listStyle(GroupedListStyle())
                }
            }
            .navigationBarTitle(rootWord)
            .navigationBarItems(trailing: Button(action: skipWord) {
                Text("Skip")
            })
                .onAppear(perform: loadWords)
                .alert(isPresented: $showError, content: {
                    Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                })
        }
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing){
            content
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                })
                {
                    Image(systemName: "delete.left").foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
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
