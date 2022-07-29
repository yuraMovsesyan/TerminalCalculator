class Processing{
    private var tokens: [Token]

    init (tokens: [Token]){
        self.tokens = tokens

        if tokens.count > 1{
            mul()
        }
    }

    func getTokens() -> [Token] {
        return tokens
    }

    private func mul(){
        for i in (0..<(tokens.count-1)).reversed(){
            if tokens[i].typeToken == Token.type.number && tokens[i + 1].value == "("{
                tokens.insert(Token(value: "*", type: Token.type.operation), at: i + 1)
            }
        }
    }
}