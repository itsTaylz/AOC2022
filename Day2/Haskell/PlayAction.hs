module PlayAction where 

data PlayAction = Rock | Paper | Scissors

actionPoints :: PlayAction -> Int
actionPoints Rock = 1
actionPoints Paper = 2
actionPoints Scissors = 3

actionBeats :: PlayAction -> PlayAction -> Bool
actionBeats Rock Scissors = True
actionBeats Paper Rock = True
actionBeats Scissors Paper = True
actionBeats _ _ = False 

actionFromChar :: Char -> PlayAction
actionFromChar c 
    | c == 'A' || c == 'X' = Rock
    | c == 'B' || c == 'Y' = Paper
    | otherwise = Scissors