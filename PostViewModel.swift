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
    URLSession.shared.dataTask(with: url) { data, response, error in 
            guard let data = data else {
             print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
               return 
            }
              do {
                    let decodedData = try JSONDecoder().decode([Post].self, from: data)
                     DispatchQueue.main.async {
                     self.posts.append(contentsOf: decodedData)
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

  func fetchPostsIfNeeded(item: Post?) {
    guard let item = item else {
      fetchPosts()
      return
    }
    
    if shouldFetchNextPage(currenItem:item) {
      fetchPosts()
    }
  }
    private func shouldFetchNextPage(currentItem: Post) -> Bool
    {
      guard let lastIndex = posts.lastIndex(where: { $0.id == currenItem.id }) else {
      return false
    }
      let thresholdIndex = posts.index(posts.endIndex, offSetBy: -5)
    return lastIndex == thresholdIndex
  }
}
