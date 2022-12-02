module PartTwo where
import PlayAction
import GameResult

calculateScore :: [String] -> Int
calculateScore [] = 0
calculateScore (x:xs) = calculateScore xs + calculateScoreAux opponentAction (getMathingAction opponentAction gameResult)
    where
        opponentAction = actionFromChar (head x)
        gameResult = resultFromChar (last x)

calculateScoreAux :: PlayAction -> PlayAction -> Int
calculateScoreAux op you = actionPoints you + resultPoints (calculateResult op you)

getMathingAction :: PlayAction -> GameResult -> PlayAction
getMathingAction op result = getMathingActionAux op result [Rock, Paper, Scissors]

getMathingActionAux :: PlayAction -> GameResult -> [PlayAction] -> PlayAction
getMathingActionAux op result [] = error "No match"
getMathingActionAux op result (x:xs)
    | calculateResult op x == result = x
    | otherwise = getMathingActionAux op result xs

main :: IO ()
main = do
    input <- readFile "input.txt"
    let inputLines = lines input
    let result = calculateScore inputLines
    print result