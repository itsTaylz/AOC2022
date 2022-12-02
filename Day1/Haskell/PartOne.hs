module AOC2022.Day1.PartTwo where

getMax :: [String] -> Int -> Int -> Int
getMax [] _ maxValue = maxValue
getMax (x:xs) acc maxValue
    | x == "" = getMax xs 0 $ max acc maxValue
    | otherwise = getMax xs (acc + read x :: Int) maxValue

main :: IO ()
main = do
    input <- readFile "input.txt"
    let stringList = lines input
    let maxValue = getMax stringList 0 0
    print maxValue
