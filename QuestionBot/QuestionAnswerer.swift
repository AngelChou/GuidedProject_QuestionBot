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
        } else {
            return "?"
        }
    }
}
