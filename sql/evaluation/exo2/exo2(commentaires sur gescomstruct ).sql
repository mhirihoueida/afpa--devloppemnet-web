/* Un temps de réflexion s'impose : la structure de la base de données vous impose de remplir les tables dans un ordre défini, 
afin de respecter les contraintes de clés étrangères.
Quel est l'ordre à adopter ? Argumenter.

----la structure de la base de données , nous impose de remplir les tables dans un ordre définis , 
pour assurer le respect des contraintes des clés étrangéres , donc l'ordre à adopter est :notre table countries, puis table
 customers, puis orders, puis orders_détails,puis products:à ce niveau , on part dans deux sens :
 le premier :table catégorie , puis table parent 
 le deuxiémé: table employees , qui est reliée d'une coté par posts et de l'autre coté par suppliers,ce dernier,qui est reliée à countries (countries , notre table qui est reliées au meme temps à customers dés le début ) */
 