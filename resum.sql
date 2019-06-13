--(0.25p) P1)	 Mostra	 les	 classes	 de	 receptes	 (RecipeClassID)	 i	 els	 noms	 (RecipeTitle)	 de	 les	
--receptes	que	tenim	a	la	base	de	dades	ordenades	per	classe	de	recepta	i	nom.	El	resultat	és:
SELECT	RecipeClassID,	RecipeTitle	FROM	Recipes	ORDER	BY	RecipeClassID,	RecipeTitle;
--(0.25p) P2)	 Mostra	 el	 nom	 dels	 ingredients	 (IngredientName)	 de	 la	 categoria	 MEAT	 que	 no	
--tenen	 la	 paraula	 CHICKEN	 en	 el	 nom	 de	 l’ingredient.	 Observació:	 no	 cal	 que	 escriguis	 una	
--subconsulta	per	obtenir	el	ID	de	la	classe	corresponent	a	Meat. Ho	pots	fer	directament	mirant	
-- els	scripts	que	et	proporcionem.	El	resultat	és:
SELECT	IngredientName	FROM	Ingredients	WHERE	(IngredientName	NOT	LIKE	'%Chicken%')	AND	(IngredientClassID	= 2);
--(0.25p) P3)	Mostra	tots	els	detalls	(és	a	dir,	tots	els	atributs)	de	les	receptes	amb	identificadors	
--(RecipeID)	compresos	entre	1	i	5.	El	resultat	són	5	files.
--(no	incloem	imatge	del	resultat	perquè	és	molt	gran)
SELECT	RecipeID,	RecipeTitle,	Preparation,	Notes	FROM	Recipes	WHERE	(RecipeID	BETWEEN	
1	AND	5);
--(0.25p) P4)	Mostra	el	nom	de	les	receptes	(RecipeTitle)	que	no	tenen	notes.	El	resultat	és:
SELECT		RecipeTitle	FROM	Recipes	WHERE	(Notes	IS	NULL);
--(1p) P5)	Mostra	el	nom	de	les	 receptes	 (RecipeTitle)	amb descripció	 (RecipeClassDescription)
--igual	a	SALAD.	El	resultat	és	1	fila:
SELECT	Recipes.RecipeTitle
FROM			Recipes
INNER	JOIN			Recipe_Classes	ON	Recipes.RecipeClassID	=	Recipe_Classes.RecipeClassID
WHERE	Recipe_Classes.RecipeClassDescription	=	'Salad';
--(1p) P6)	Mostra	el	número	de	receptes	que	hi	ha	de	cada	classe.	El	resultat	ha	de	mostrar	el	ID	
--de	la	classe	de	les	receptes	(RecipeClassID),	la	seva	descripció,	i	la	quantitat que	hi	ha	de	cada	
--classe.	El	resultat	és:	
SELECT	 	 RecipeClassID,	 RecipeClassDescription,	 	 (SELECT	 COUNT(*)	 FROM	 Recipes	 WHERE	
Recipes.RecipeClassID	 =	 Recipe_Classes.RecipeClassID)	 AS	 RecipeCount	 FROM				
Recipe_Classes;
--(1p) P7)	Mostra	RecipeClassDescription	de	les	classes	de	receptes	que	no	tenen	cap	recepta	a	
--la	base	de	dades.	El	resultat	és	1	fila:	
--Soup
SELECT	Recipe_Classes.RecipeClassDescription
FROM	Recipe_Classes
LEFT	OUTER	JOIN	Recipes ON	Recipe_Classes.RecipeClassID	= Recipes.RecipeClassID
WHERE	Recipes.RecipeID	IS	NULL
--(1p) P8)	Mostra	el	nom	dels	ingredients	que	no	s’han	usat	a	cap	recepta.	El	resultat	és:
SELECT	Ingredients.IngredientName	
FROM	Ingredients	
LEFT	OUTER	JOIN	Recipe_Ingredients	ON	Ingredients.IngredientID	=	
Recipe_Ingredients.IngredientID	
WHERE	Recipe_Ingredients.RecipeID	IS	NULL;
--(1p) P9)	 Quantes	 receptes	 tenen	 ingredients	 a	 on	 el	 nom	 d’alguns	 dels	 seus	 ingredients	
--comenci	amb	la	paraula	Beef?	El	resultat	és:	
--3	receptes.
SELECT	COUNT(*)	AS	NumberOfRecipes
FROM	Recipes
WHERE	Recipes.RecipeID IN	
(SELECT	RecipeID	FROM	Recipe_Ingredients	INNER	JOIN	Ingredients	ON	
Recipe_Ingredients.IngredientID	=	Ingredients.IngredientID	WHERE	
Ingredients.IngredientName	LIKE	'Beef%');
--(2p) P10)	Quantes	receptes	diferents	hi	ha	per	a	cada	classe	d’ingredient?	El resultat	és:
SELECT	Ingredient_Classes.IngredientClassDescription,	Count(DISTINCT	RecipeID)	AS	
CountOfRecipeID	
FROM	Ingredient_Classes	
INNER	JOIN	Ingredients	ON	
Ingredient_Classes.IngredientClassID	=	Ingredients.IngredientClassID		INNER	JOIN	
Recipe_Ingredients	ON	Ingredients.IngredientID	=	Recipe_Ingredients.IngredientID	
GROUP	BY	Ingredient_Classes.IngredientClassDescription;
--Contesta	a una	de	les	dos	preguntes	següents:
--(2p) P11)	Mostra	el	nom	de	la	recepta	(RecipeTitle),	el	nom	dels	seus	ingredients,	la	descripció	
--de	 la	 mesura	 dels	 ingredients	 (MeasurementDescription)	 i	 la	 quantitat	 (Amount)	 de	 les	
--receptes	que	són	plat	principal	(Main	course).	Pots	utilitzar	vistes.	El	resultat	són:
--53	files
SELECT	Recipes.RecipeTitle	AS	Nom,	 Ingredients.IngredientName	AS	ING,	
Measurements.MeasurementDescription	AS	MES,	Recipe_Ingredients.Amount	AS	NUM
FROM	Recipe_Classes	
INNER	JOIN		Recipes	ON	Recipes.RecipeClassID	=	Recipe_Classes.RecipeClassID
INNER	JOIN		Recipe_Ingredients	ON	Recipes.RecipeID	=	Recipe_Ingredients.RecipeID
INNER	JOIN		Ingredients	ON	Ingredients.IngredientID	=	Recipe_Ingredients.IngredientID	
INNER	JOIN		Measurements	ON	Measurements.MeasureAmountID	=	
Recipe_Ingredients.MeasureAmountID WHERE	Recipe_Classes.RecipeClassDescription	=	
'Main	course';
--(2p) P11)	Mostra	el	nom	de	les	receptes	(RecipeTitle)	de	les	receptes	que	tinguin	Beef	i	Garlic	
--en	els	seus	ingredients	(és	a	dir,	IngredientName=’Beef’	AND	IngredientName=’Garlic’).	.	Pots	
--utilitzar	vistes.	El	resultat	és:
--Roast	Beef
CREATE	VIEW	beef	AS SELECT	Recipes.RecipeID,	Recipes.RecipeTitle FROM	Recipes	
INNER	JOIN		Recipe_Ingredients	ON	Recipes.RecipeID	=	Recipe_Ingredients.RecipeID
INNER	JOIN	Ingredients	ON	Ingredients.IngredientID	=	Recipe_Ingredients.IngredientID
WHERE	Ingredients.IngredientName	=	'Beef';
CREATE	VIEW	garlic	AS SELECT	Recipe_Ingredients.RecipeID
FROM	 	 	 Recipe_Ingredients	 INNER	 JOIN	 Ingredients	 ON	 Ingredients.IngredientID	 =	
Recipe_Ingredients.IngredientID WHERE	Ingredients.IngredientName	=	'Garlic';
SELECT	BeefRecipes.RecipeTitle	FROM	beef	As	BeefRecipes
INNER	JOIN	garlic	AS	GarlicRecipes	ON	BeefRecipes.RecipeID	=	GarlicRecipes.RecipeID;