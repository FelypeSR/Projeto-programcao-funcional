import Criterion.Main
import System.Random (randomRs, newStdGen)
import Data.List (unfoldr)

-- Quick Sort
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = 
    let smallerSorted = quickSort [a | a <- xs, a <= x]
        biggerSorted = quickSort [a | a <- xs, a > x]
    in  smallerSorted ++ [x] ++ biggerSorted

-- Bubble Sort
bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort xs = go xs (length xs)
  where
    go xs 0 = xs
    go xs n = go (bubble xs) (n - 1)
    bubble [] = []
    bubble [x] = [x]
    bubble (x:y:xs)
      | x > y     = y : bubble (x:xs)
      | otherwise = x : bubble (y:xs)

-- Gerando listas aleatórias
generateRandomList :: Int -> IO [Int]
generateRandomList n = do
    gen <- newStdGen
    return $ take n $ randomRs (1, 100000) gen

main :: IO ()
main = do
    let sizes = [10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000]
    lists <- mapM generateRandomList sizes
    defaultMain [ bgroup "Quick Sort" [ bench (show n) $ nf quickSort list | (n, list) <- zip sizes lists ]
                , bgroup "Bubble Sort" [ bench (show n) $ nf bubbleSort list | (n, list) <- zip sizes lists ]
                ]
