//
//  HotelListView.swift
//  Hurb
//
//  Created by Arthur Givigir on 12/27/20.
//

import SwiftUI

struct HotelListView: View {
    
    @ObservedObject var hotelListViewModel = HotelListViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    
                    HStack {
                        TextField("Buscar por cidade:", text: self.$hotelListViewModel.searchByCity)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    }
                    
                    List {
                        ForEach(self.hotelListViewModel.groupedHotels ?? [], id: \.section) { groupedHotel in
                            
                            Section(header: HeaderSectionView(stars: groupedHotel.section)) {
                                ForEach(groupedHotel.hotels ?? [], id: \.id) { hotel in
                                    Text("\(hotel.name)")
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Hurb")
        }
        
    }
}

struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListView()
    }
}