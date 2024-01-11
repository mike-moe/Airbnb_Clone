
import SwiftUI
enum DestinationOptionSearch {
    case location
    case dates
    case guests
}
struct DestinationSearchView: View {
    @Binding var show : Bool
   
    @State var selectedOption : DestinationOptionSearch = .location
    @State var startDate = Date()
    @State var endDate = Date()
    @State var numberOfGuest: Int = 0
    @ObservedObject var viewModel : ExploreViewModel
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation(.snappy){
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle").foregroundStyle(.black).imageScale(.large)
                })
                Spacer()
                Button(action: {
                    withAnimation(.snappy){
                        if(!viewModel.searchLocation.isEmpty){
                            viewModel.searchLocation = ""
                            viewModel.updateListingForLocation()
                            show.toggle()
                        }
                    }
                }, label: {
                    Text("Clear")
                }).disabled(viewModel.searchLocation.isEmpty)
            }.padding()
        // where
            VStack(alignment:.leading){
                Text("Where to?").font(.title).fontWeight(.bold).frame(maxWidth: .infinity)
                if selectedOption == .location{
                    HStack{
                        Image(systemName: "magnifyingglass").imageScale(.small)
                        TextField("Search Destination",text: $viewModel.searchLocation).font(.subheadline).onSubmit {
                            viewModel.updateListingForLocation()
                            show.toggle()
                        }
                    }.frame(height: 44).padding(.horizontal).overlay{
                        RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1).foregroundColor(.gray)
                    }
                }
               
            }.padding()
                .background(.white).clipShape(RoundedRectangle(cornerRadius: 12)).padding().shadow(radius: 10).onTapGesture {
                 
                    withAnimation(.snappy){
                        selectedOption = .location
                    }
                }
        }
        // MARK: add dates
        //when
        if selectedOption == .dates{
            DatePickerComponent(startDate : $startDate,endDate : $endDate)
           
        }else{
            SubBox(title: "When",description:"Add Dates").onTapGesture {
                
                withAnimation(.snappy){
                    selectedOption = .dates
                }
            }
        }
        
        // guests
        if selectedOption == .guests{
            GuestsPicker(numberOfGuest: $numberOfGuest)
        }else{
            SubBox(title: "Who",description:"Add Guests").onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .guests
                }
            }
        }
        
        
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService())
    )
}
struct SubBox: View{
    let title: String
    let description: String
    
    var body: some View{
        VStack{
            HStack{
                Text(title).foregroundStyle(.gray)
                Spacer()
                Text(description).fontWeight(.semibold).font(.headline)
                
            }.fontWeight(.semibold)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius: 10)
    }
}

// MARK: Date Picker
struct DatePickerComponent : View {
    @Binding var startDate : Date
    @Binding var endDate : Date
    var body: some View {
        HStack{
            VStack{
                
                DatePicker("From", selection: $startDate, displayedComponents: .date)
                Spacer()
                DatePicker("To", selection: $endDate, displayedComponents: .date)
            }
        }.padding()
            .frame(maxWidth: .infinity,maxHeight: 100)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}// MARK: Guests Picker
struct GuestsPicker : View {
    @Binding var numberOfGuest : Int
    var body: some View {
      
        HStack{
            Text("Number of Guests:").fontWeight(.semibold)
            Spacer()
            Stepper{
                Text ("\(numberOfGuest) Adults")
            }onIncrement: {
                guard numberOfGuest < 4 else {return}
                numberOfGuest += 1
            }onDecrement: {
                guard numberOfGuest > 0 else {return}
                numberOfGuest -= 1
            }
        }.padding()
            .frame(maxWidth: .infinity,maxHeight: 100)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
