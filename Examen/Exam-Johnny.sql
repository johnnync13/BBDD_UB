--(3p) Exercici 1. Mostra l’identificador de la recepta, el nom de la recepta, i el nom dels ingredients, d’aquelles receptes quetenen “carrots” en els seus ingredients. Utilitza una vista. El resultat són aquestes 16 files.

CREATE VIEW carrotC AS SELECT re.recipeid FROM recipes re
INNER JOIN recipe_ingredients rein ON re.recipeid=rein.recipeid 
INNER JOIN ingredients ing ON ing.ingredientid=rein.ingredientid WHERE ing.ingredientname='Carrot';

SELECT re.recipeid,re.recipetitle,ing.ingredientname 
FROM recipes re INNER JOIN recipe_ingredients rei ON re.recipeid=rei.recipeid 
INNER JOIN ingredients ing ON ing.ingredientid=rei.ingredientid 
INNER JOIN carrot ON re.recipeid=carrot.recipeid;


--(2p) Exercici 2. Mostra els ingredients que no s’utilitzen a cap recepta. El resultat són aquestes 20 files.

SELECT ingredients.ingredientname FROM ingredients LEFT OUTER JOIN recipe_ingredients ON ingredients.ingredientid=recipe_ingredients.ingredientid WHERE recipe_ingredients.recipeid IS NULL;

--(3p) Exercici 3. Mostra la recepta que requereix més quantitat d’all (Garlic). El resultat és 1 fila = Roast Beef
--No m'ha sortit. Faria un SELECT MAX(measureamountid) i d'alguna forma ho he de adjuntar amb la altra tabla ingredients per obtenir el nom

--(2p) Exercici 4. . Mostra tots els noms d’ingredients que són de la classe Meat i el número de receptes en el que cada ingredient apareix. Si l’ingredient no apareix a cap recepta, es mostra el número 0. El resultat és:

SELECT icd.ingredientclassdescription,ing.ingredientname,COUNT(rein.recipeid) AS recipecount FROM recipe_ingredients rein RIGHT OUTER JOIN ingredients ing ON rein.ingredientid=ing.ingredientid RIGHT OUTER JOIN ingredient_classes icd ON icd.ingredientclassid=ing.ingredientclassid WHERE icd.ingredientclassdescription='Meat' GROUP BY icd.ingredientclassdescription,ing.ingredientname; 
