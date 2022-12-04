module PartOne where

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

isSubset :: [Int] -> [Int] -> Bool
isSubset [] ys = True
isSubset (x:xs) ys
    | x `elem` ys = isSubset xs ys
    | otherwise = False


checkOverlap :: String -> Bool
checkOverlap xs = isSubset section1 section2 || isSubset section2 section1
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