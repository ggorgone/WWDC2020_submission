//#-hidden-code
import SwiftUI
import PlaygroundSupport
import AVFoundation
struct ContentView: View {
    
    @State private var open = true
    
    private var lockEffect: AVAudioPlayer?
    private var wrongEffect: AVAudioPlayer?
    
    init(){
        let path = Bundle.main.path(forResource: "lock_sound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        let path1 = Bundle.main.path(forResource: "wrong_buzz.mp3", ofType:nil)!
        let url1 = URL(fileURLWithPath: path1)
        
        do{
            lockEffect = try AVAudioPlayer(contentsOf: url)
            wrongEffect = try AVAudioPlayer(contentsOf: url1)
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
            HStack {
                Button(action: {
                    if(self.open){
                        self.open = false
                        self.lockEffect?.play()
                    }else {
                        self.wrongEffect?.play()
                    }
                }) { 
                    Image(uiImage: UIImage(named: "key_2.png")!)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .rotation3DEffect(.degrees(-45), axis: (x: 0, y: 0, z: 1))
                }
                
                Button(action: {
                    if(!self.open){
                        self.open = true
                        self.lockEffect?.play()
                    } else {
                        self.wrongEffect?.play()
                    }
                }) { 
                    Image(uiImage: UIImage(named: "key_3.png")!)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .rotation3DEffect(.degrees(-45), axis: (x: 0, y: 0, z: 1))
                }
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    }
}


PlaygroundPage.current.setLiveView(ContentView().background(Color.white))
//#-end-hidden-code

/*:
 Remember what we said before? We had one key that did two things. It could open and close the padlock. That's the weak point!
 
 To solve this problem we should have one padlock, but with two keys. **One key opens the padlock, the other one closes it**. This way I will send to my girlfriend the open padlock, and the key for closing it. I will keep the other key, the one that opens the padlock.
 
 If you run the code, you will be able to see how this works by tapping on keys and observing how the padlock changes.
 
 This type of keys are called **asymmetric** because each key can perform only one action, and it's not capable to perform the opposite of that action.
 
* **Red key** : this one closes the padlock. I will send this to my girlfriend together with the open padlock and the chest.
* **Blue key** : this one opens the padlock. I will keep this safe by not sending it trough the comunication medium. This way I will be the only one able to open the padlock.
 
 The keys that are made like the red one are also called **public keys** because you have to share them in order to make the comunication happen.
 
 The keys that are made like the blue one are also called **private keys** because you have to keep them private and safe to be sure nobody will read messages intended for you.
 */
