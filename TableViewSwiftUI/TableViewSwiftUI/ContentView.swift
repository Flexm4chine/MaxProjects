//
//  ContentView.swift
//  TableViewSwiftUI
//
//  Created by Admin on 02.11.2020.
//

import SwiftUI

struct ListCustom: View {
    
 //   @Binding var massive : Array<String>
    
    @State var cityName = ""
    @State var cityTemp = ""
    @State var indexL : Int
    
    
    @State var offset = CGSize.zero
    @State var scale : CGFloat = 1
    
    @ObservedObject var wA = WeatherApi()
    
    var body: some View {
        HStack(spacing: 5){
            Text(cityName)
                .frame(width: UIScreen.main.bounds.width - 160, height: 50)
                .font(.largeTitle)
               // .background(Color.white)
              // .border(Color.gray, width: 1)
            Text(cityTemp)
                .frame(width: 100, height: 50)
                .font(.subheadline)
                //.background(Color.white)
                //.border(Color.gray, width: 1)
            Button(action: {
                print("\(wA.cityTempAr.count) элементы массива")
                print("\(indexL) ебучий индекс")
                
                wA.cityNameAr.remove(at: indexL)
                wA.cityTempAr.remove(at: indexL)
                // self.tasksMassive.remove(at: self.tasksMassive.index(of: tmID)!)
                print("tapped")
                
            }, label:{Image(systemName: "trash")} )
            .foregroundColor(.black)
            .font(.system(size: 20))
            .frame(width: 50, height: 50)
            .background(Color.red.opacity(0.35))
        }
        .border(Color.gray, width: 1)
        .offset(self.offset)
         .animation(.spring())
         .gesture(DragGesture()
                    .onChanged { gestrue in
                        self.offset.width = gestrue.translation.width
                    }
                    .onEnded { _ in
                        if self.offset.width < -50 {
                            self.offset.width = -50
                        } else {
                            self.offset = .zero
                        }})
      //  .offset(self.offset)
    }
}


struct ContentView: View {
    
    @State var tasksMassive = ["Помыть пол","Выгулять собаку","Позвонить Сергею","Сделать приложение"]
    @State var isPresented = false
    @State var text : String = ""
    
    @State var textTest : String = "Tut text"
    
    
    @ObservedObject var tempDannie = WeatherApi()
    
    init(){
        tempDannie.parserSS(currCity: "Moscow")
        tempDannie.parserSS(currCity: "London")
        tempDannie.parserSS(currCity: "Washington")
    }
    
    var isHidden = true
    
    var body: some View {
        
        
        NavigationView{
            ScrollView(.vertical){
               
                    VStack {
                        ForEach(0..<tempDannie.cityNameAr.count, id: \.self) { index in
                            HStack{
                                    
                                    ListCustom(cityName: tempDannie.cityNameAr[index], cityTemp: tempDannie.cityTempAr[index], indexL: index)
                                
                                
                                
                            }
                            
                            .padding(.bottom,1)
                            
                        }
                        
                        Button(action: {
                            for i in 0..<(tempDannie.cityNameAr.count) {
                                
                                print("\(tempDannie.cityTempAr.count) элементы массива")
                                
                                print("\(tempDannie.cityNameAr[i]) CityName")
                                print("\(tempDannie.cityTempAr[i]) CityTemp")
                            }
                            
                //            for i in 0..<(tempDannie.datas.count) {
                //                print("\(tempDannie.datas) tut dannie")
                //            }
                            
                        } , label: {Text("Проверить массив")})
                        
                        .padding(.bottom,1)
                    }
                    
                    
                }
            
        }
        
        
        
        
        
        
//        NavigationView{
//            ZStack{
//                LazyVStack(){
//                    ForEach(tasksMassive, id: \.self) { tmID in
//                        HStack{
//                            ListCustom(textF: tmID)
//                            Button(action: {
//                                    self.tasksMassive.remove(at: self.tasksMassive.index(of: tmID)!)
//
//                            }, label:{Image(systemName: "trash")} )
//                            .font(.system(size: 20))
//                            .frame(width: 50, height: 50)
//                            .background(Color.red.opacity(0.35))
//                        }.animation(.spring())
//                         .gesture(DragGesture()
//                                    .onChanged { gestrue in
//                                        self.offset.width = gestrue.translation.width
//                                    }
//                                    .onEnded { _ in
//                                        if self.offset.width < -50 {
//                                            self.offset.width = -50
//                                        } else {
//                                            self.offset = .zero
//
//                                        }})
//                                .padding(.bottom,1)
//                        }
//                  //  Text(textTest)
//                }
//                .padding(.bottom, UIScreen.main.bounds.height / 8)
//                .padding(.leading, UIScreen.main.bounds.width / 6)
//                .navigationBarItems(trailing: Button("Add"){
//                    print("Added")
//                    self.isPresented = !isPresented
//                })
//                .navigationBarTitle("Задачи")
//                .listStyle(GroupedListStyle())
//
//                EZAlert(title: "Add Item", isShown: $isPresented, textF: $text, onDone: { text in
//
//                    tasksMassive.append(text)
//                    print(self.tasksMassive.count)
//                })
//
//                Button(action: {
//                    tempDannie.parserSS(currCity: "Moscow")
//                    tempDannie.parserSS(currCity: "London")
//                    for i in 0..<(tempDannie.cityNameAr.count) {
//                        print("\(tempDannie.cityNameAr[i]) CityName")
//                        print("\(tempDannie.cityTempAr[i]) CityTemp")
//                    }
//
//                    for i in 0..<(tempDannie.datas.count) {
//                        print("\(tempDannie.datas) tut dannie")
//                    }
//
//                } , label: {Text("Tut shoto")})
//
//            }
//
//        }
    }
    
    func fDelete(at offsets: IndexSet){
        tasksMassive.remove(atOffsets: offsets)
    }
    func fMove(from source: IndexSet, to destination: Int){
        tasksMassive.move(fromOffsets: source, toOffset: destination)
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
