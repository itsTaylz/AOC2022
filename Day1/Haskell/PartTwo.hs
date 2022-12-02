module AOC2022.Day1.PartTwo where

getMax3 :: [String] -> (Int, Int, Int)
getMax3 xs = getMax3Aux xs 0 (0, 0, 0)

getMax3Aux :: [String] -> Int -> (Int, Int, Int) -> (Int, Int, Int)
getMax3Aux [] _ result = result
getMax3Aux (x:xs) acc result
    | x == "" = getMax3Aux xs 0 $ insertIntoTuple acc result
    | otherwise = getMax3Aux xs (acc + read x :: Int) result

insertIntoTuple :: Int -> (Int, Int, Int) -> (Int, Int, Int)
insertIntoTuple n (x, y, z) 
    | n > x = (n, y, z)
    | n > y = (x, n, z)
    | n > z = (x, y, n)
    | otherwise = (x, y, z)

main :: IO ()
main = do
    input <- readFile "input.txt"
    let stringList = lines input
    let (r1, r2, r3) = getMax3 stringList
    let answer = r1 + r2 + r3
    print answer