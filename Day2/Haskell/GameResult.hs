module GameResult where 
import PlayAction

data GameResult = Defeat | Draw | Victory deriving (Eq)

resultPoints :: GameResult -> Int
resultPoints Defeat = 0
resultPoints Draw = 3
resultPoints Victory = 6

resultFromChar :: Char -> GameResult
resultFromChar 'X' = Defeat
resultFromChar 'Y' = Draw 
resultFromChar _ = Victory

calculateResult :: PlayAction -> PlayAction -> GameResult
calculateResult op you 
    | actionBeats op you = Defeat
    | actionBeats you op = Victory
    | otherwise = Draw

allValues :: [GameResult]
allValues = [Defeat, Draw, Victory]

