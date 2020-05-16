
public func safeSendToGirlFriend (_ safeBox : ChestAndPadlock, _ key : KeyThatOpensAndCloses){
    girlfriendWritesMeASecretMessage(safeBox, key)
}

func sagirlfriendWritesMeASecretMessage (_ safeBox : ChestAndPadlock, _ key : KeyThatOpensAndCloses){
    safeBox.tryToOpen(key: key)
    safeBox.writeSecretMessage(newSecretMessage: "I LOVE YOU SO MUCH GIOVANNI <3 <3 <3")
    safeBox.tryToClose(key: key)
}
