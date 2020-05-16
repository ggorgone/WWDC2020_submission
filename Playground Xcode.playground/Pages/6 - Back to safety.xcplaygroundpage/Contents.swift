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
                Image(uiImage: UIImage(named: "boyfriend_happy.png")!)
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
                
                
                Image(uiImage: UIImage(named: "key_2.png")!)
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
                
                Image(uiImage: UIImage(named: "key_3.png")!)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .offset(x: 125,y:0)              
                
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
 A-HA ! CHECKMATE HACKER!
 
 Run the code, and see what happens now.
 After that my girlfriend closes the padlock, even if the hackers intercepts our communication he is not able anymore to open the padlock because only I have the key for doing it!
 
 I'm happy again!
 
 */
// Create a chest with a padlock
let chestAndPadlock = ChestAndPadlock()

// Obtain a pair of keys, one for opening and one for closing
let (keyThatOpens,keyThatCloses) = chestAndPadlock.generateAsymmetricKeys()

// Send to my girlfriend chest,padlock and ONLY the key for closing and wait for everything to come back
// The comunication medium will NOT be safe
unsafeSendToGirlFriend(chestAndPadlock, keyThatCloses)

// Unlock the padlock with the key for opening, and open the chest
chestAndPadlock.tryToOpen(key: keyThatOpens)

// Read the love message my girlfriend wrote
let girlfriendMessage = chestAndPadlock.readSecretMessage()
