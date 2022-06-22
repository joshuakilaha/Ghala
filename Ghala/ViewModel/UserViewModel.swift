//
//  UserViewModel.swift
//  Ghala
//
//  Created by mroot on 11/05/2022.
//

import Foundation


@MainActor
class UserViewModel: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    @Published var isLoading: Bool = false
    @Published var toOTP: Bool = false
    @Published var toPin: Bool = false
    @Published var user: User = .init()

    var userService: UserService
    init(userService: UserService) {
        self.userService = userService
    }
    //MARK: -Check If UserExists
    func checkIfUserExists(phoneNumber: String) async {
        do {
            isLoading = true
            user.phoneNumber = phoneNumber
            let checked = try await userService.checkIfUserExists(user: user)
            print(checked.exists)
            let userStatus = checked.exists
            DispatchQueue.main.async {
                self.isLoading = false
                if userStatus != false {
                    self.toPin = true
                    print("To Pin View")
                } else {
                    self.toOTP = true
                    print("To OTP Screen")
                }
            }
        } catch {
            isLoading = false
            print(error.localizedDescription)
            handleError(error: error.localizedDescription)
        }
    }
    func handleError(error: String) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMsg = error
            self.showAlert.toggle()
        }
    }
}
