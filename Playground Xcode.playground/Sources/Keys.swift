
public class KeyThatOpensAndCloses{
    let safeBoxId : String
    init(safeBoxId: String) {
        self.safeBoxId = safeBoxId
    }
}

public class KeyThatOpens {
    let safeBoxId : String
    init(safeBoxId: String) {
        self.safeBoxId = safeBoxId
    }
}

public class KeyThatCloses {
    let safeBoxId : String
    init(safeBoxId: String) {
        self.safeBoxId = safeBoxId
    }
}

public class AsimmetricKeys {
    let keyForOpening : KeyThatOpens
    let keyForClosing : KeyThatCloses
    
    init(safeBoxId: String) {
        self.keyForClosing = KeyThatCloses(safeBoxId: safeBoxId)
        self.keyForOpening = KeyThatOpens(safeBoxId: safeBoxId)
    }
}
