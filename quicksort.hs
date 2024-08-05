import System.Random (randomRIO)--
import Data.List (sort)  -- Para comparar com o quicksort

-- Função para gerar uma lista aleatória de números inteiros entre 1 e 1.000.000
generateRandomList :: Int -> IO [Int]
generateRandomList n = mapM (\_ -> randomRIO (1, 10000)) [1..n]

-- Função QuickSort
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted

-- Função principal
main :: IO ()
main = do
    -- Gerar uma lista de 10 números aleatórios para teste (pode ajustar o número)
    randomList <- generateRandomList 10000
    putStrLn "Lista aleatória gerada:"
    print randomList
    
    -- Ordenar a lista usando quicksort
    let sortedList = quicksort randomList
    putStrLn "Lista ordenada com QuickSort:"
    print sortedList

    -- Comparar com a função de ordenação padrão
    let sortedList' = sort randomList
    putStrLn "Lista ordenada com a função sort padrão:"
    print sortedList'
