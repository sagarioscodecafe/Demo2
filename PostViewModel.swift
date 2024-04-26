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
    URLSession.shared.dataTask(with: url) {data, response, error in 
                                          guard let data = data else {
                                            print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                                            return }
                                           do {
                                             let decodeData = try JSONDecoder().decode([Post].self, from: data)
                                             DispatchQueue.main.async{
                                               self.posts.append(contentsOf: decodeData)
                                               self.currentPage += 1
                                               }
                                           }
                                           catch _ {
                                             print("Error")
                                           }
                                          }.resume()
  }
}


extension PostViewModel {

  func fetchpostsIfNeeded(item: Post?)
  
}
