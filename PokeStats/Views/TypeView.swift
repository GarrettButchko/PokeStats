//
//  PokeView.swift
//  PokeNew
//
//  Created by Garrett Butchko on 10/21/24.
//

import SwiftUI

struct TypeView: View {
    
    let type: PurpleType
        
    init (filePath: String){
        type = Bundle.main.decode(filePath + "index.json")
    }
    
    var body: some View {
        ScrollView{
            Text(type.name!.toNormalCase())
                    .font(.title)
                    .bold()
        }
    }
}
