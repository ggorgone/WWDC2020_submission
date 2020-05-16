//#-hidden-code
import SwiftUI
import PlaygroundSupport
struct ContentView: View {
    
    @State private var lock_offset : CGFloat = 60
    @State private var key_offset : CGFloat = 60
    @State private var message_offset : CGFloat = 60
    @State private var medium_opacity : Double = 1
    @State private var hacker_opacity : Double = 0
    @State private var opacity_happy : Double = 0
    
    
    var body: some View {
        VStack{
            ZStack{
                Image(uiImage: UIImage(named: "boyfriend_neutral.png")!)
                    .resizable()
                    .frame(width: 200, height: 200)
                Image(uiImage: UIImage(named: "boyfriend_sad.png")!)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .opacity(opacity_happy)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 0.5).delay(15)
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
                                    self.lock_offset = 275
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                        return withAnimation(baseAnimation){
                                            self.lock_offset = 60
                                        }
                                    }
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
                                    self.key_offset = 275
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                        return withAnimation(baseAnimation){
                                            self.key_offset = 60
                                        }
                                    }
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
                                    self.message_offset = 275
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                        return withAnimation(baseAnimation){
                                            self.message_offset = 60
                                        }
                                    }
                                }
                            }
                        }
                }
            }
            
            ZStack{
                Rectangle()
                    .fill(Color.red)
                    .border(Color.black, width: 4)
                    .frame(width: 18, height: 350)
                    .opacity(medium_opacity)
                    .onAppear() {
                        let flashing_animation = Animation.easeInOut(duration: 0.5)
                        let rep = flashing_animation.repeatForever(autoreverses: true)
                        return withAnimation(rep) {
                            self.medium_opacity = 0
                        }
                }
                Image(uiImage: UIImage(named: "hacker.png")!)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .opacity(hacker_opacity)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 0.5).delay(6)
                        return withAnimation(baseAnimation){
                            self.hacker_opacity = 1
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                                return withAnimation(baseAnimation){
                                    self.hacker_opacity = 0
                                    
                                    
                                }
                            }
                        }
                }
            }
            
            Image(uiImage: UIImage(named: "girlfriend.png")!)
                .resizable()
                .frame(width: 200, height: 200)
            
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    }
}


PlaygroundPage.current.setLiveView(ContentView().background(Color.white))
//#-end-hidden-code
/*:
 Oh no! Our comunication medium is not safe anymore!
 
 As you will see running the code, a dangerous hacker is in the medium we are using for comunications. And since we are sending the padlock together with the key, he is able to open it and look into the chest.
 He can read the love message my girlfriend sent me, in the worst case he can also modify it and I will never be sure if the message I will receive was written by my girlfriend, or by the hacker.
 
 😭
 
 We should do something!
 
 Do we really need to send a key like this in the comunication medium?
 
 Does my girlfriend really **needs a key capable of locking and unlocking** the padlock?
 */
// Create a chest with a padlock
let chestAndPadlock = ChestAndPadlock()

// Obtain the key of that padlock
let key = chestAndPadlock.generateKey()

// Send to my girlfriend chest,padlock and key and wait for everything to come back
// The comunication medium will NOT be safe
unsafeSendToGirlFriend(chestAndPadlock, key)

// Unlock the padlock and open the chest
chestAndPadlock.tryToOpen(key: key)

// The hacker overwrite the message my girlfriend wrote
var girlfriendMessage = chestAndPadlock.readSecretMessage()
