//#-hidden-code
import SwiftUI
import PlaygroundSupport
struct ContentView: View {
    
    @State private var lock_offset : CGFloat = 60
    @State private var key_offset : CGFloat = 60
    @State private var message_offset : CGFloat = 60
    @State private var opacity_happy : Double = 0
    
    var body: some View {        
        VStack{
            ZStack{
                Image(uiImage: UIImage(named: "boyfriend_neutral.png")!)
                    .resizable()
                    .frame(width: 200, height: 200)
                Image(uiImage: UIImage(named: "boyfriend_happy.png")!)
                .resizable()
                .frame(width: 200, height: 200)
                .opacity(opacity_happy)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 0.5).delay(10)
                        return withAnimation(baseAnimation){
                            self.opacity_happy = 1
                        }
                }
                
                Image(uiImage: UIImage(named: "lock_closed.png")!)
                .resizable()
                .frame(width: 75, height: 75)
                    .offset(x: 50 ,y:lock_offset)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 3).delay(1)
                        return withAnimation(baseAnimation){
                            self.lock_offset = 410
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                return withAnimation(baseAnimation){
                                    self.lock_offset = 60
                                }
                            }
                        }
                }
                
                Image(uiImage: UIImage(named: "key_1.png")!)
                .resizable()
                .frame(width: 75, height: 75)
                    .offset(x: 125,y:key_offset)
                .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 3).delay(1)
                        return withAnimation(baseAnimation){
                            self.key_offset = 410
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                return withAnimation(baseAnimation){
                                    self.key_offset = 60
                                }
                            }
                        }
                }
                
                Image(uiImage: UIImage(named: "chest.png")!)
                .resizable()
                .frame(width: 75, height: 75)
                    .offset(x: -50,y:self.message_offset)
                .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 3).delay(1)
                        return withAnimation(baseAnimation){
                            self.message_offset = 410
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                return withAnimation(baseAnimation){
                                    self.message_offset = 60
                                }
                            }
                        }
                }
            }
            
            Rectangle()
                .fill(Color.green)
                .border(Color.black, width: 4)
                
            .frame(width: 18, height: 350)
            Image(uiImage: UIImage(named: "girlfriend.png")!)
                .resizable()
                .frame(width: 200, height: 200)
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    }
}

PlaygroundPage.current.setLiveView(ContentView().background(Color.white))
//#-end-hidden-code
/*:
Here we are. My girlfriend wants to send me a love message. So i send her 3 things :

* a chest in which she will put the message she wants to send me
* a padlock for securing the chest
* the key for that padlock
 
She writes the love message, put it into the chest, closes the padlock with the key and sends everything back to me.
 I open the padlock with the key, get the love message from the chest, read it and I'm happy 😍
 
 Do you spot some weak points in that this way of comunicating ?
 

 Let's take a closer look at the padlock and the key.
 

*/

// Create a chest with a padlock
let chestAndPadlock = ChestAndPadlock()

// Obtain the key of that padlock
let key = chestAndPadlock.generateKey()

// Send to my girlfriend chest,padlock and key and wait for everything to come back
// The comunication medium will be safe
safeSendToGirlFriend(chestAndPadlock, key)

// Unlock the padlock and open the chest
chestAndPadlock.tryToOpen(key: key)

// Read the love message my girlfriend wrote
var girlfriendMessage = chestAndPadlock.readSecretMessage()
