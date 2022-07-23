class Token {
    enum type {
        case number, bracket, operation
    }
    
    let value: String
    let typeToken: type

    init (value: String, type: type){
        self.value = value
        self.typeToken = type
    }
}