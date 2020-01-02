//
//  ValidateDisableFormView.swift
//  SweetTreats
//
//  Created by Daniel Barclay on 02/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ValidateDisableFormView: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating an account...")
                }
            }
            .disabled(username.isEmpty || email.isEmpty || disableForm)
        }
    }
}

struct ValidateDisableFormView_Previews: PreviewProvider {
    static var previews: some View {
        ValidateDisableFormView()
    }
}
