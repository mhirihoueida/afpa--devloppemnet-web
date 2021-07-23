
START TRANSACTION;
SELECT nomfou FROM fournis WHERE numfou = 120;    
UPDATE fournis SET nomfou = 'GROSBRIGAND' WHERE numfou = 120;
SELECT nomfou FROM fournis WHERE numfou = 120; 

/*l'exécution des instruction ligne par ligne 
1- START TRANSACTION;
retour >>>résultat vide
2-SELECT nomfou FROM fournis WHERE numfou = 120; 
retour >>1 résultat (nomfou: GROBRIGAN)
3- UPDATE fournis SET nomfou = 'GROSBRIGAND' WHERE numfou = 120;
RETOUR >> 1 ligne affectée.
4-SELECT nomfou FROM fournis WHERE numfou = 120;
RETOUR >> 1 RÉSULTAT (nomfou: GROSBRIGAND)
*/


/* je conclue que excuter les instructions ligne par ligne , 
   ou tout exécuter d'un coup dans le cadre d'une transcation , donnera les mémes résultats .
    
    non , la transaction n'est pas encore terminé . à la fin il faut , 
    soit rendre la modification permanante par la commande (COMMIT),
    ou soit annuler la transaction par la commande (ROLLBACK),
*/
