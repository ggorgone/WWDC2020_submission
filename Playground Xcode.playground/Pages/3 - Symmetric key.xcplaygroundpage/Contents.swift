//#-hidden-code
import SwiftUI
import PlaygroundSupport
import AVFoundation
struct ContentView: View {
    
    @State private var open = true
    var lockEffect: AVAudioPlayer?
    
    init(){
        let path = Bundle.main.path(forResource: "lock_sound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            lockEffect = try AVAudioPlayer(contentsOf: url)
        } catch {
            
        }       
    }
    
    
    var body: some View {        
        VStack (spacing : 30){
            ZStack {
                Image(uiImage: UIImage(named: "lock_closed.png")!)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(open ? 0 : 1)
                Image(uiImage: UIImage(named: "lock_open.png")!)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(open ? 1 : 0)
            }
            Button(action: {
                self.open.toggle()
                self.lockEffect?.play()
            }) {
                Image(uiImage: UIImage(named: "key_1.png")!)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .rotation3DEffect(.degrees(-45), axis: (x: 0, y: 0, z: 1))
            }
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    }
}


PlaygroundPage.current.setLiveView(ContentView().background(Color.white))
//#-end-hidden-code
/*:
 These are the padlock and the key I sent her. As you can see running the code, clicking on the key will **open and close** the padlock.
 We have one key that does two things. This is why  keys like this are called **"symmetric"** : because the actions they can perform are the opposite of each other.
 
 As long as the key is safe, there will be no problems.
 But I have to send the key to my girlfriend to have her close the padlock and secure the chest.
 
 What will happen if someone is in the medium we are using to comunicate?  
 */
