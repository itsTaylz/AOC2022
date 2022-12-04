module PartTwo where

splitString :: String -> Char -> [String]
splitString xs c = splitStringAux xs c "" []
    where
        splitStringAux :: String -> Char -> String -> [String] -> [String]
        splitStringAux [] _ str result = result ++ [str]
        splitStringAux (x:xs) c str result
            | x /= c = splitStringAux xs c (str ++ [x]) result
            | otherwise = splitStringAux xs c "" (result ++ [str])

getSectionsInterval :: String -> [Int]
getSectionsInterval xs = [(head intList)..(last intList)]
    where
        intList = map read (splitString xs '-')

hasCommon :: [Int] -> [Int] -> Bool
hasCommon [] ys = False
hasCommon (x:xs) ys
    | x `elem` ys = True
    | otherwise = hasCommon xs ys


checkOverlap :: String -> Bool
checkOverlap xs = hasCommon section1 section2
    where
        sections = splitString xs ','
        section1 = getSectionsInterval $ head sections
        section2 = getSectionsInterval $ last sections


calculateResult :: [String] -> Int
calculateResult [] = 0
calculateResult (x:xs) = calculateResult xs + if checkOverlap x then 1 else 0

main :: IO ()
main = do
    input <- readFile "input.txt"
    let inputLines = lines input
    let result = calculateResult $ lines input
    print result
    return ()