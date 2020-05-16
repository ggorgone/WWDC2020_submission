
public class ChestAndPadlock {
    private var isOpen : Bool = true
    private var secretMessage : String = ""
    private var safeBoxId : String = ""
    private var availableKeys: Bool = true
    
    public init() {
        self.safeBoxId = generateUniqueId(length: 20)
    }
    
    public func generateKey() -> KeyThatOpensAndCloses{
        if (isOpen) {
            if(availableKeys) {
                availableKeys = false
                return KeyThatOpensAndCloses(safeBoxId: self.safeBoxId)
            }else {
                print("NO KEY AVAILABLE")
                return KeyThatOpensAndCloses(safeBoxId: "")
            }
        } else {
            print("YOU SHOULD OPEN THE SAFE TO GENERATE A KEY")
            return KeyThatOpensAndCloses(safeBoxId: "")
        }
    }
    
    public func generateAsymmetricKeys() -> (KeyThatOpens,KeyThatCloses) {
        if (isOpen) {
            if(availableKeys) {
                return (KeyThatOpens(safeBoxId: self.safeBoxId),KeyThatCloses(safeBoxId: self.safeBoxId))
            } else {
                print("NO KEY AVAILABLE")
                return (KeyThatOpens(safeBoxId: ""),KeyThatCloses(safeBoxId: ""))
            }
        } else {
            print("YOU SHOULD OPEN THE SAFE TO GENERATE A KEY")
            return (KeyThatOpens(safeBoxId: ""),KeyThatCloses(safeBoxId: ""))
        }
    }
    
    private func generateUniqueId(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
        
    }
    
    public func printStatus() {
        if (isOpen) {
            print("THE SAFE IS NOW OPEN!")
        } else {
            print("THE SAFE IS NOW CLOSED!")
        }
    }
    
    public func tryToOpen(key : KeyThatOpensAndCloses) {
        if (!isOpen) {
            if (key.safeBoxId == self.safeBoxId) {
                isOpen = true
            }
        }
    }
    
    public func tryToOpen(key : KeyThatOpens) {
        if (!isOpen) {
            if (key.safeBoxId == self.safeBoxId) {
                isOpen = true
            }
        }
    }
    
    public func tryToClose(key: KeyThatOpensAndCloses) {
        if (isOpen) {
            if (key.safeBoxId == self.safeBoxId) {
                isOpen = false
            }
        }
    }
    
    public func tryToClose(key: KeyThatCloses) {
        if (isOpen) {
            if (key.safeBoxId == self.safeBoxId) {
                isOpen = false
            }
        }
    }
    
    public func readSecretMessage() -> String {
        if(isOpen) {
            return self.secretMessage
        } else {
            return ""
        }
    }
    
    public func writeSecretMessage(newSecretMessage : String) {
        if(isOpen) {
            self.secretMessage = newSecretMessage
        }
    }
}
