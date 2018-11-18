struct MyQuestionAnswerer {
    func responseTo(question: String) -> String {
        //    return "?"
        let lowerQuestion = question.lowercased()
        if lowerQuestion.hasPrefix("hello") {
            return "Why, hello there!"
        } else if lowerQuestion == "where are the cookies?" {
            return "In the cookie jar!"
        } else if lowerQuestion.hasPrefix("where"){
            return "To the North!"
        } else if lowerQuestion.hasPrefix("can") {
            return "Yes, you can!"
        } else if lowerQuestion.hasPrefix("should"){
            return "No, you shouldn't!"
        } else if lowerQuestion == "why you call penguin"{
            return "Because I look like a penguin."
        } else if lowerQuestion == "who am i" {
            return "I'm SpiderMan!"
        } else if lowerQuestion == "what is your favorite movie?" {
            return "Mission Impossible!"
        } else if lowerQuestion.hasPrefix("我會") && lowerQuestion.hasSuffix("嗎"){
            return "只要你想要，沒有什麼事是不可能的！"
        } else {
            return "?"
        }
    }
}
