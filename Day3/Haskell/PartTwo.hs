module PartTwo where
import Data.Char
import Data.List

priorityOf :: Char -> Int
priorityOf c
    | isLower c = 1 + head (c `elemIndices` ['a'..'z'])
    | otherwise = 27 + head (c `elemIndices` ['A'..'Z'])

findCommon :: String -> String -> String -> Char
findCommon [] _ _ = error "No common!"
findCommon (x:xs) ys zs
    | x `elem` ys && x `elem` zs = x
    | otherwise = findCommon xs ys zs


calculateResult :: [String] -> Int
calculateResult (x:y:z:xs) = priorityOf commonItem + calculateResult xs
    where
        commonItem = findCommon x y z 
calculateResult _ = 0

main :: IO ()
main = do
    input <- readFile "input.txt"
    let result = calculateResult $ lines input
    print result
    return ()