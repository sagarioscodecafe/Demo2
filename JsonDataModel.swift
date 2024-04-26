import Foundation
import SwiftUI


struct Post: Codable, Identifiable {

  let id : Int
  let userId: Int
  let title: String
  let body: String
}
