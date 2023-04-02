import qualified Data.Set as Set

-- INSERT YOUR SOURCE CODE HERE
-- and remove its first line "module PE1 where"


-- TESTCASES
-- (Index, your Output, Expected Output)

-- Testcases for Question 1
testcasesQ1 = [
    (1, getIngredientCost ("Tomato", 300) [Price "Tomato" 1000 20], 6.0),
    (2, getIngredientCost ("Tomato", 250) [Price "Potato" 1000 30, Price "Tomato" 1000 20], 5.0),
    (3, getIngredientCost ("Butter", 400) [Price "Potato" 1000 30, Price "Butter" 100 8, Price "Tomato" 1000 20], 32.0),
    (4, getIngredientCost ("Spaghetti", 200) [Price "Penne" 500 10, Price "Gnocchi" 500 50, Price "Spaghetti" 500 12], 4.8),
    (5, getIngredientCost ("Mince", 500) [Price "Mince" 1000 200], 100.0),
    
    -- Custom
    (6, getIngredientCost ("A", 5) [Price "A" 20 1500], 375.0),
    (7, getIngredientCost ("B", 0) [Price "B" 33 200.77], 0.0),
    (8, getIngredientCost ("C", 10) [Price "C" 4 1, Price "Butter" 100 8, Price "Tomato" 1000 20], 2.5),
    (9, getIngredientCost ("D",1) [Price "D"  1 0.175], 0.18),
    (10, getIngredientCost ("E", 5) [Price "E" 33 200.77], 30.42)
    --erroneous case?
    --,(11, getIngredientCost ("E", 5) [Price "A" 0 200], 4)
    ]

-- Testcases for Question 2

testcasesQ2 = [
    (1, recipeCost toast prices1, 8.75),
    (2, recipeCost tomatoPasta prices1, 20.3),
    (3, recipeCost friedEgg prices1, 5.25),
    (4, recipeCost tomatoPasta prices2, 21.8),
    (5, recipeCost toast prices2, 18.75),
    
    -- Custom
    (6, recipeCost toast prices3, 7.17),
    (7, recipeCost tomatoPasta prices3, 16.32),
    (8, recipeCost friedEgg prices3, 2.95),
    (9, recipeCost tomatoPasta prices4, 64.9),
    (10, recipeCost toast prices4, 13.62),
    (11, recipeCost friedEgg prices4, 17.64),
    (12, recipeCost tomatoPasta prices5, 1299.67),
    (13, recipeCost toast prices5, 95.62),
    (14, recipeCost friedEgg prices5, 137.84),
    (15, recipeCost (Recipe "" []) prices5, 0.0),
    (16, recipeCost (Recipe "" [("A", 3), ("B", 3), ("C", 1)]) [Price "A" 1 0.05, Price "B" 1 0.07, Price "C" 1 0.003], 0.36)
    ] where
        toast = Recipe "Toast" [("Bread", 100), ("Cheese", 50), ("Butter", 25)]
        tomatoPasta = Recipe "Tomato Pasta" [("Tomato", 500), ("Olive Oil", 10), ("Cheese", 50), ("Pasta", 250)]
        friedEgg = Recipe "Fried Egg" [("Egg", 120), ("Butter", 25)]
        prices1 = [Price "Tomato" 1000 12, Price "Potato" 1000 20, Price "Cheese" 500 50, Price "Flour" 1000 5, Price "Yeast" 10 2, Price "Bread" 400 10, Price "Butter" 100 5, Price "Pasta" 500 15, Price "Egg" 60 2,  Price "Olive Oil" 500 90]
        prices2 = [Price "Tomato" 1000 10, Price "Potato" 1000 20, Price "Cheese" 250 50, Price "Flour" 1000 5, Price "Yeast" 10 2, Price "Bread" 400 10, Price "Butter" 100 25, Price "Pasta" 500 10, Price "Egg" 60 2, Price "Olive Oil" 500 90]
        prices3 = [Price "Tomato" 611 10, Price "Potato" 182 20, Price "Cheese" 762 50, Price "Flour" 19 5, Price "Yeast" 925 2, Price "Bread" 835 10, Price "Butter" 232 25, Price "Pasta" 816 10, Price "Egg" 939 2, Price "Olive Oil" 500 90]
        prices4 = [Price "Tomato" 611 51.057, Price "Potato" 182 45.835, Price "Cheese" 762 50.962, Price "Flour" 19 86.739, Price "Yeast" 925 15.302, Price "Bread" 835 17.053, Price "Butter" 232 76.461, Price "Pasta" 816 61.503, Price "Egg" 939 73.529, Price "Olive Oil" 955.49 90]
        prices5 = [Price "Tomato" 30.023 51.057 , Price "Potato" 99.033 45.835 , Price "Cheese" 78.587 50.962 , Price "Flour" 85.933 86.739 , Price "Yeast" 56.786 15.302 , Price "Bread" 39.55 17.053 , Price "Butter" 95.212 76.461 , Price "Pasta" 36.96 61.503 , Price "Egg" 74.928 73.529 , Price "Olive Oil" 955.49 90]

-- Testcases for Question 3
testcasesQ3:: [ (Int, [(String, Double)], [(String, Double)] ) ]
testcasesQ3 = [
    (1, missingIngredients toast stock1, [("Bread",100.0),("Butter",15.0)]),
    (2, missingIngredients toast stock2, []),
    (3, missingIngredients tomatoPasta stock1, [("Olive Oil",10.0)]),
    (4, missingIngredients friedEgg stock2, [("Egg",120.0)]),
    (5, missingIngredients tomatoPasta stock2, [("Tomato",500.0),("Olive Oil",10.0),("Pasta",250.0)]),
    (6, missingIngredients toast stock3, []),
    (7, missingIngredients friedEgg2 stock3, [("Egg",120.99)])
    ] where
        stock1 = [("Tomato", 500.0), ("Cheese", 50), ("Butter", 10), ("Pasta", 250)]
        stock2 = [("Cheese", 100.0), ("Butter", 250), ("Orange", 1000), ("Chocolate", 200), ("Bread", 500)]
        toast = Recipe "Toast" [("Bread", 100), ("Cheese", 50), ("Butter", 25)]
        tomatoPasta = Recipe "Tomato Pasta" [("Tomato", 500), ("Olive Oil", 10), ("Cheese", 50), ("Pasta", 250)]
        friedEgg = Recipe "Fried Egg" [("Egg", 120), ("Butter", 25)]
        stock3 = [("Cheese", 100.999), ("Butter", 250), ("Orange", 1000), ("Chocolate", 200), ("Bread", 500)]
        friedEgg2 = Recipe "Fried Egg" [("Egg", 120.989), ("Butter", 25)]


-- Testcases for Question 4
testcasesQ4:: [ (Int, [(String, Double)], [(String, Double)] ) ]
testcasesQ4 = [
    (1, makeRecipe stock1 toast, [("Tomato",500.0),("Cheese",50.0),("Butter",10.0),("Pasta",250.0)]),
    (2, makeRecipe stock2 toast, [("Cheese",50.0),("Butter",225.0),("Orange",1000.0),("Chocolate",200.0),("Bread",400.0)]),
    (3, makeRecipe stock1 friedEgg, [("Tomato",500.0),("Cheese",50.0),("Butter",10.0),("Pasta",250.0)]),
    (4, makeRecipe stock1 tomatoPasta, [("Tomato",500.0),("Cheese",50.0),("Butter",10.0),("Pasta",250.0)]),
    (5, makeRecipe stock2 tomatoPasta, [("Cheese",100.0),("Butter",250.0),("Orange",1000.0),("Chocolate",200.0),("Bread",500.0)]),
    
    -- Custom
    (6, makeRecipe stock3 toast, []),
    (7, makeRecipe [("Olive Oil", 0.001), ("Cheese", 50.99)] (Recipe "" [("Olive Oil", 0.2), ("Cheese", 50.99)]),    [("Cheese",50.99)]),
    (8, makeRecipe [("Mospel", 0.9063)] tomatoPasta, [("Mospel", 0.91)]),
    (9, makeRecipe [("Olive Oil", 0.9033), ("Cheese", 50.99)] (Recipe "" [("Olive Oil", 0.2), ("Cheese", 50.99)]),   [("Olive Oil",0.7)])


    
    
    ] where
        stock1 = [("Tomato", 500.0), ("Cheese", 50), ("Butter", 10), ("Pasta", 250)]
        stock2 = [("Cheese", 100.0), ("Butter", 250), ("Orange", 1000), ("Chocolate", 200), ("Bread", 500)]
        toast = Recipe "Toast" [("Bread", 100), ("Cheese", 50), ("Butter", 25)]
        tomatoPasta = Recipe "Tomato Pasta" [("Tomato", 500), ("Olive Oil", 10), ("Cheese", 50), ("Pasta", 250)]
        friedEgg = Recipe "Fried Egg" [("Egg", 120), ("Butter", 25)]
        stock3 = [("Bread", 100), ("Cheese", 50), ("Butter", 25)]


-- Testcases for Question 5
testcasesQ5:: [ (Int, [(String, Double, Double)], [(String, Double, Double)] ) ]
testcasesQ5 = [
    (1, makeShoppingList stock1 [toast, friedEgg] prices1, [("Bread",100.0,2.5),("Butter",40.0,2.0),("Egg",120.0,4.0)]),
    (2, makeShoppingList stock1 [tomatoPasta, friedEgg] prices1, [("Olive Oil",10.0,1.8),("Butter",15.0,0.75),("Egg",120.0,4.0)]),
    (3, makeShoppingList stock1 [toast, tomatoPasta, friedEgg] prices2, [("Bread",100.0,2.5),("Cheese",50.0,10.0),("Butter",40.0,10.0),("Egg",120.0,4.0),("Olive Oil",10.0,1.8)]),
    (4, makeShoppingList stock2 [toast, tomatoPasta] prices2, [("Pasta",250.0,5.0),("Olive Oil",10.0,1.8),("Tomato",500.0,5.0)]),
    (5, makeShoppingList stock2 [toast, friedEgg, tomatoPasta] prices2, [("Tomato",500.0,5.0),("Olive Oil",10.0,1.8),("Pasta",250.0,5.0),("Egg",120.0,4.0)]),

    -- Custom
    (6, makeShoppingList stock1 [toast2, friedEgg] prices3, [("Bread",16.9,0.2),("Butter",15.33,1.65),("Egg",120.0,0.26)]),
    (7, makeShoppingList stock1 [tomatoPasta, friedEgg] prices3, [("Olive Oil",10.0,1.8),("Egg",120.0,0.26),("Butter",15.0,1.62)]),
    (8, makeShoppingList stock1 [toast2, tomatoPasta, friedEgg] prices4, [("Bread",16.9,0.35),("Cheese",6.78,0.45),("Butter",15.33,5.05),("Olive Oil",10.0,0.94),("Egg",120.0,9.4)]),
    (9, makeShoppingList stock2 [toast2, tomatoPasta] prices4, [("Tomato",500.0,41.78),("Olive Oil",10.0,0.94),("Pasta",250.0,18.84)]),
    (10, makeShoppingList stock2 [toast2, friedEgg, tomatoPasta] prices4, [("Egg",120.0,9.4),("Tomato",500.0,41.78),("Olive Oil",10.0,0.94),("Pasta",250.0,18.84)]),
    (11, makeShoppingList stock1 [toast2, friedEgg] prices5, [("Bread",16.9,7.29),("Butter",15.33,12.31),("Egg",120.0,117.76)]),
    (12, makeShoppingList stock1 [tomatoPasta, friedEgg] prices5, [("Olive Oil",10.0,0.94),("Egg",120.0,117.76),("Butter",15.0,12.05)]),
    (13, makeShoppingList stock3 [toast2, tomatoPasta, friedEgg] prices5, [("Bread",16.9,7.29),("Tomato",400.22,680.61),("Olive Oil",10.0,0.94),("Egg",120.0,117.76)]),
    (14, makeShoppingList stock3 [toast2, tomatoPasta] prices5, [("Bread",16.9,7.29),("Tomato",400.22,680.61),("Olive Oil",10.0,0.94)]),
    (15, makeShoppingList stock3 [toast2, friedEgg, tomatoPasta] prices5, [("Bread",16.9,7.29),("Egg",120.0,117.76),("Tomato",400.22,680.61),("Olive Oil",10.0,0.94)])
    ] where
        stock1 = [("Tomato", 500.0), ("Cheese", 50), ("Butter", 10), ("Pasta", 250)]
        stock2 = [("Cheese", 100.0), ("Butter", 250), ("Orange", 1000), ("Chocolate", 200), ("Bread", 500)]
        toast = Recipe "Toast" [("Bread", 100), ("Cheese", 50), ("Butter", 25)]
        tomatoPasta = Recipe "Tomato Pasta" [("Tomato", 500), ("Olive Oil", 10), ("Cheese", 50), ("Pasta", 250)]
        friedEgg = Recipe "Fried Egg" [("Egg", 120), ("Butter", 25)]
        prices1 = [Price "Tomato" 1000 12, Price "Potato" 1000 20, Price "Cheese" 500 50, Price "Flour" 1000 5, Price "Yeast" 10 2, Price "Bread" 400 10, Price "Butter" 100 5, Price "Pasta" 500 15, Price "Egg" 60 2,  Price "Olive Oil" 500 90]
        prices2 = [Price "Tomato" 1000 10, Price "Potato" 1000 20, Price "Cheese" 250 50, Price "Flour" 1000 5, Price "Yeast" 10 2, Price "Bread" 400 10, Price "Butter" 100 25, Price "Pasta" 500 10, Price "Egg" 60 2, Price "Olive Oil" 500 90]
        prices3 = [Price "Tomato" 611 10, Price "Potato" 182 20, Price "Cheese" 762 50, Price "Flour" 19 5, Price "Yeast" 925 2, Price "Bread" 835 10, Price "Butter" 232 25, Price "Pasta" 816 10, Price "Egg" 939 2, Price "Olive Oil" 500 90]
        prices4 = [Price "Tomato" 611 51.057, Price "Potato" 182 45.835, Price "Cheese" 762 50.962, Price "Flour" 19 86.739, Price "Yeast" 925 15.302, Price "Bread" 835 17.053, Price "Butter" 232 76.461, Price "Pasta" 816 61.503, Price "Egg" 939 73.529, Price "Olive Oil" 955.49 90]
        prices5 = [Price "Tomato" 30.023 51.057 , Price "Potato" 99.033 45.835 , Price "Cheese" 78.587 50.962 , Price "Flour" 85.933 86.739 , Price "Yeast" 56.786 15.302 , Price "Bread" 39.55 17.053 , Price "Butter" 95.212 76.461 , Price "Pasta" 36.96 61.503 , Price "Egg" 74.928 73.529 , Price "Olive Oil" 955.49 90]
        toast2 = Recipe "Toast2" [("Bread", 16.9), ("Cheese", 6.777), ("Butter", 0.3333)]
        stock3 = [("Tomato", 99.777), ("Cheese", 59.631), ("Butter", 136.59), ("Pasta", 250)]

checkQ1 (_, yourOutput, expOutput) = yourOutput == expOutput

resultQ1 = map checkQ1 testcasesQ1
strQ1 = ["TestcaseQ1 #" ++ (show idx) ++ " failed. " ++
            "Expected " ++ (show expOutput) ++ ". " ++
            "Got " ++ (show yourOutput)
            | (idx, yourOutput, expOutput)<-testcasesQ1, not (resultQ1 !! (idx-1))]



checkQ2 (_, yourOutput, expOutput) = yourOutput == expOutput

resultQ2 = map checkQ2 testcasesQ2
strQ2 = ["TestcaseQ2 #" ++ (show idx) ++ " failed. " ++
            "Expected " ++ (show expOutput) ++ ". " ++
            "Got " ++ (show yourOutput)
            | (idx, yourOutput, expOutput)<-testcasesQ2, not (resultQ2 !! (idx-1))]



checkQ3 (_, yourOutput, expOutput) = Set.fromList yourOutput == Set.fromList expOutput

resultQ3 = map checkQ3 testcasesQ3
strQ3 = ["TestcaseQ3 #" ++ (show idx) ++ " failed. " ++
            "Expected " ++ (show expOutput) ++ ". " ++
            "Got " ++ (show yourOutput) ++ ". "
            | (idx, yourOutput, expOutput)<-testcasesQ3, not (resultQ3 !! (idx-1))]



checkQ4 (_, yourOutput, expOutput) = Set.fromList yourOutput == Set.fromList expOutput

resultQ4 = map checkQ4 testcasesQ4
strQ4 = ["TestcaseQ4 #" ++ (show idx) ++ " failed. " ++
            "Expected " ++ (show expOutput) ++ ". " ++
            "Got " ++ (show yourOutput)
            | (idx, yourOutput, expOutput)<-testcasesQ4, not (resultQ4 !! (idx-1))]



checkQ5 (_, yourOutput, expOutput) = Set.fromList yourOutput == Set.fromList expOutput

resultQ5 = map checkQ5 testcasesQ5
strQ5 = ["TestcaseQ5 #" ++ (show idx) ++ " failed. " ++
            "Expected " ++ (show expOutput) ++ ". " ++
            "Got " ++ (show yourOutput)
            | (idx, yourOutput, expOutput)<-testcasesQ5, not (resultQ5 !! (idx-1))]



strAll = concat [strQ1, strQ2, strQ3, strQ4, strQ5]
totalCasesCnt = length testcasesQ1 + length testcasesQ2 + length testcasesQ3 + length testcasesQ4 + length testcasesQ5
totalFailedCnt = sum $ map length [strQ1, strQ2, strQ3, strQ4, strQ5]
totalPassedCnt = totalCasesCnt - totalFailedCnt
main = do
    mapM_ putStrLn strAll
    putStrLn ("Passed: " ++ (show totalPassedCnt) ++ "/" ++ (show totalCasesCnt) )

