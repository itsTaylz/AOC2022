module PartOne where
import Data.Char
import Data.List

priorityOf :: Char -> Int
priorityOf c
    | isLower c = 1 + head (c `elemIndices` ['a'..'z'])
    | otherwise = 27 + head (c `elemIndices` ['A'..'Z'])

splitList :: [a] -> ([a], [a])
splitList xs = splitListAux xs (length xs) 0 ([], [])
    where
        splitListAux :: [a] -> Int -> Int -> ([a], [a]) -> ([a], [a])
        splitListAux [] _ _ result = result
        splitListAux (x:xs) size i (a, b)
            | i < size `div` 2 = splitListAux xs size (i+1) (a ++ [x], b)
            | otherwise = splitListAux xs size (i+1) (a, b ++ [x])

findCommon :: Eq a => [a] -> [a] -> a
findCommon [] _ = error "No common"
findCommon (x:xs) ys
    | x `elem` ys = x
    | otherwise = findCommon xs ys

calculateResult :: [String] -> Int
calculateResult [] = 0
calculateResult (x:xs) = priorityOf commonItem + calculateResult xs
    where
        commonItem = uncurry findCommon $ splitList x


main :: IO ()
main = do
    input <- readFile "input.txt"
    let result = calculateResult $ lines input
    print result
    return ()