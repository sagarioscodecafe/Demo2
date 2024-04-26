import SwiftUI

struct ContentView: View {
@ObserfvedObject var viewModel = PostViewModel()
var body: some View {
List{ ForEach(viewModel.posts) { post in 

NavigationLink  (destination:
 PostDetailVBiew (post:post)){
 Vstack(alignment: .leading ) {

Text(post.title)
.font(.headline)
Text(post.body)
.font(.subheadline)
.foregroundColor(.gray)
 }

 }.onAppear {
 self.viewModel.fetchpostIfNeeded(item:self.viewModel.posts.last }

}.navigationTitle("posts")
}

}

}
}

stuct PostDetailView : View {
  let post: Post
var body: some View {
VStack(alignment: .leading) {
 Text(post.title)
   .font(.title)
.padding()

Text(post.body)
   .font(.body)
.padding()

Spacer()


}
.navigationTitle(Text(post.title))
}

}

#Preview {
 ContentView()
}
