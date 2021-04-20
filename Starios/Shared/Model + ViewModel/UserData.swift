//
//  UserData.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import SwiftUI
import Combine

final class UserData: ObservableObject{
    @Published var showMarkedOnly = false
    @Published var missionItems = MissionItem.self
}
