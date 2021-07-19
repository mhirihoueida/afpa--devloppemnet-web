/* tous d'abord j'ai installé mongodb (la bd pour stocker les données massives )en utilisant le tuto suivant : 
https://linuxhint.com/install_mongodb_ubuntu_20_04/  
puis j'ai téléchrager tobo3t .
en commande ,  j'ai mit en marche mongodb avec la commande (sudo systenctl start mongodb )
puis j'ai ouvert mongo avec (sudo mango),  je suis dans ma base de données ,puis j'ai crée ma base de donnée , jarditou ,en rentant les commande suivate : 
 */
 --choisir la base des données 
 use jarditou,
 --création des collections(tables)
 show collections
categories
produits

--remplir la collection categories 
 -- remplir le premiére document(ligne)
 db.categories.insert({"cat_id":"1",
...                     "cat_nom":"outillage",
...                     "cat_parent":"null",
...                     })
-- remplir le deuxiéme document(ligne)
 db.categories.insert({"cat_id":"2",
...                     "cat_nom":"outillage manuel",
...                     "cat_parent":"1",
...                     })
--remplir le troisiéme document(ligne) 
db.categories.insert({"cat_id":"3",
...                     "cat_nom":"outillage mécanique",
...                     "cat_parent":"2",
...                     })
--remplir le quatriéme document(ligne)
db.categories.insert({"cat_id":"4",
...                     "cat_nom":"plants et semis",
...                     "cat_parent":"null",
...                     }) 
--remplir le cinqiéme document(ligne)
db.categories.insert({"cat_id":"5",
...                     "cat_nom":"arbres et arbustes",
...                     "cat_parent":"null",
...                     }) 
--remplir la collection produits 
--remplir le premier document 

 db.produits.insert({"pro_id":"7",
...                   "pro_cat_id":"27",
...                     "pro_ref":"barb001",
                       "pro_libelle":"aramis",
                       "pro_description":"jzdchhzehfuze",
                       "pro_prix" :"110.00",
                       "pro_stock":"2",
                       "pro_couleur":"brun",
                       "pro_photo":"jpg",
                       "pro_d_ajout":"2020-06-18",
                       "pro_d_modif":"2020-07-12",
                       "pro_bloque" : " null",
...                     })

--remplir le deuxieme document 
db.produits.insert({"pro_id":"8",
...                   "pro_cat_id":"27",
...                     "pro_ref":"barb002",
                       "pro_libelle":"athos",
                       "pro_description":"jzdchhzehnschj",
                       "pro_prix" :"249.00",
                       "pro_stock":"0",
                       "pro_couleur":"noir",
                       "pro_photo":"jpg",
                       "pro_d_ajout":"2019-06-18",
                       "pro_d_modif":"2019-07-12",
                       "pro_bloque" : " null",
...                     })
--remplir le troisieme document 
db.produits.insert({"pro_id":"11",
...                   "pro_cat_id":"27",
...                     "pro_ref":"barb003",
                       "pro_libelle":"clatronic",
                       "pro_description":"jzdcjkbdcehnschj",
                       "pro_prix" :"135.90",
                       "pro_stock":"10",
                       "pro_couleur":"chrome",
                       "pro_photo":"jpg",
                       "pro_d_ajout":"2017-10-18",
                       "pro_d_modif":"null",
                       "pro_bloque" : " null",
...                     })
--remplir le quatrieme document 
db.produits.insert({"pro_id":"12",
...                   "pro_cat_id":"27",
...                     "pro_ref":"barb004",
                       "pro_libelle":"camping",
                       "pro_description":"Phasellus auctor mattis justo, in semper urna cong...",
                       "pro_prix" :"88.00",
                       "pro_stock":"5",
                       "pro_couleur":"noir",
                       "pro_photo":"jpg",
                       "pro_d_ajout":"2018-08-20",
                       "pro_d_modif":"null",
                       "pro_bloque" : " 1",
...                     })

--remplir le cinqieme document 
db.produits.insert({"pro_id":"13",
...                   "pro_cat_id":"13",
...                     "pro_ref":"barb001",
                       "pro_libelle":"green",
                       "pro_description":"Fusce interdum ex justo, vel imperdiet erat volutp..",
                       "pro_prix" :"49.00",
                       "pro_stock":"25",
                       "pro_couleur":"verte",
                       "pro_photo":"jpg",
                       "pro_d_ajout":"2018-08-01",
                       "pro_d_modif":"null",
                       "pro_bloque" : " null",
...                     })

--la requete de selection 
-- 1 er exemple
db.categories.find (
{cat_nom: 'outillage'}
)
--2 eme exemple
db.produits.find (

{pro_id: '12'}
)

--la requete d'insertion 
db.categories.insertOne (
{
cat_id: '6',cat_nom:'mobilier de jardin' ,cat_parent:'null' }
)
--la requette de modification 


db.categories.update( { cat_id: "2" }, { cat_id: "7", cat_nom: "outillage" , cat_parent:"null"} )

 --la requette de suppression 

 db.categories.deleteMany ({cat_nom: 'outillage'})