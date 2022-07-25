class Lexer{
    private var tokens: [Token] = []
    let line: String

    init(line: String){
        self.line = line
        initTokens()
    }

    func getTokens() -> [Token] { tokens }

    func initTokens(){
        var buffer = ""
        var type: Token.type? = nil

        func setType(_ t: Token.type?){
            if type == nil{
                type = t
            } else if type != t{
                if buffer != ""{
                    tokens += [Token(value: buffer, type: type!)]
                    buffer = ""
                }
                type = t
            } else if type == Token.type.bracket {
                tokens += [Token(value: buffer, type: type!)]
                buffer = ""
            }
        }

        for s in line{
            switch s {
                case "0"..."9": setType(Token.type.number)

                case "+": setType(Token.type.operation)
                case "-": setType(Token.type.operation)
                case "*": setType(Token.type.operation)
                case "/": setType(Token.type.operation)

                case "(": setType(Token.type.bracket)
                case ")": setType(Token.type.bracket)

                default: continue 
            }

            buffer += String(s)
        }

        tokens += [Token(value: buffer, type: type!)]
    }

    func printTokens(){
        for token in tokens{
            print("['\(token.value)']\t[\(token.typeToken)]")
        }
    }
}