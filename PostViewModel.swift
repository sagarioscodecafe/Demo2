import Foundation
class PostViewModel : ObservableObject {

  @Published var posts = [Post]()

  var currenPage = 1
  var itemsPerPage = 10
  init() {
    fetchPosts()
  } 
  func fetchPosts() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    else {return}

    
  }
}
