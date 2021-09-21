//
//  Api_view.swift
//  app
//
//  Created by Aditya Khadke on 08/09/21.
//

import SwiftUI

struct Api_view: View {
    @State var post: [Post] = []
    var body: some View {
        List(post) { post in
            Text(post.title)
        }
        
        .onAppear() {
            Api().getPost { (post) in
                self.post = post
            }
                    
            }
        }
    }


struct Api_view_Previews: PreviewProvider {
    static var previews: some View {
        
        Api_view()
        }
    }

