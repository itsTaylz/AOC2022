module PartOne where
import GameResult (GameResult, resultPoints, calculateResult)
import PlayAction (PlayAction, actionPoints, actionFromChar)

calculateScore :: [String] -> Int
calculateScore [] = 0
calculateScore (x:xs) = calculateScore xs + calculateScoreAux (actionFromChar (head x)) (actionFromChar (last x))

calculateScoreAux :: PlayAction -> PlayAction -> Int
calculateScoreAux op you = actionPoints you + resultPoints (calculateResult op you)

main :: IO ()
main = do
    input <- readFile "input.txt"
    let inputLines = lines input
    let result = calculateScore inputLines
    print result