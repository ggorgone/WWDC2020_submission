
public func unsafeSendToGirlFriend (_ safeBox : ChestAndPadlock, _ key : KeyThatOpensAndCloses){
    girlfriendWritesMeASecretMessage(safeBox, key)
    hackersTriesToChangeTheSecretMessage(safeBox, key)
}

func hackersTriesToChangeTheSecretMessage (_ safeBox : ChestAndPadlock, _ key : KeyThatOpensAndCloses){
    safeBox.tryToOpen(key: key)
    safeBox.writeSecretMessage(newSecretMessage: "MESSAGE HACKED!")
    safeBox.tryToClose(key: key)
    
}

func girlfriendWritesMeASecretMessage (_ safeBox : ChestAndPadlock, _ key : KeyThatOpensAndCloses){
    safeBox.tryToOpen(key: key)
    safeBox.writeSecretMessage(newSecretMessage: "I LOVE YOU SO MUCH GIOVANNI <3 <3 <3")
    safeBox.tryToClose(key: key)
}

public func unsafeSendToGirlFriend (_ safeBox : ChestAndPadlock, _ key : KeyThatCloses){
    girlfriendWritesMeASecretMessage(safeBox, key)
    hackersTriesToChangeTheSecretMessage(safeBox, key)
}

func hackersTriesToChangeTheSecretMessage (_ safeBox : ChestAndPadlock, _ key : KeyThatCloses){
    // can't try to open with a key that is made for closing
    //safeBox.tryToOpen(key: key)
    safeBox.writeSecretMessage(newSecretMessage: "MESSAGE HACKED!")
    safeBox.tryToClose(key: key)  
}

func girlfriendWritesMeASecretMessage (_ safeBox : ChestAndPadlock, _ key : KeyThatCloses){
    // can't try to open with a key that is made for closing
    //safeBox.tryToOpen(key: key)
    safeBox.writeSecretMessage(newSecretMessage: "I LOVE YOU SO MUCH GIOVANNI <3 <3 <3")
    safeBox.tryToClose(key: key)
}
