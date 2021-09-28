<?php
//les données pour les employés
$e1 = new employes("rahmouni", "Saida", "17-07-2010", "commerciale", 1700,"Commercial","lens","Restaurant d'entreprise","Non"); 
$e2 = new employes("mhiri", "rafik", "16-10-2020", "Animateur", 900,"commercial","Nice","Restaurant d'entreprise","Oui"); 
$e3 = new employes("bensaid", "mohamed", "07-12-2016", "Entretien", 800,"Entretien","Amiens","Restaurant d'entreprise","Oui"); 
$e4 = new employes("morjene", "nesrine", "24-02-2014", "Vigile", 1200,"Securite","Marseille","Tickets Restaurant","Oui"); 
$e5 = new employes("mhiri", "walid", "19-08-2005", "DRH", 2700,"RH","Paris","Tickets Restaurant","Oui"); 
//  les attributs pour la direction
$d1 = new direction("cardinali", "victore", "10-09-2010", "directeur", 3500,"Direction","Arras","Restaurant d'entreprise","Oui"); 
$d2 = new direction("toriste", "rougé", "16-09-2020", "directeur", 3500,"Direction","Nice","Restaurant d'entreprise","Non"); 
$d3 = new direction("pochet", "isabel", "07-11-2010", "Directrice", 14000,"Direction","Amiens","Restaurant d'entreprise","Oui"); 
$d4 = new direction("grondin", "eric", "14-12-2010", "directeur", 3500,"Direction","Paris","Tickets Restaurant","Oui"); 
$d5 = new direction("bouliterau", "ali", "26-03-2010", "directeur", 3500,"Direction","Paris","Tickets Restaurant","Non"); 



// les données pour les agences

$a1 = new agence("makarouna","1 rue marcel paul ",62000,"Arras","Restaurant d'entreprise");
$a2 = new agence("moulekeya","66 rue boulvard de pomme ",29200,"Brest","Restaurant d'entreprise");
$a3 = new agence("resto.tunisien"," 100 rue simone signoret",80000,"Amiens","Restaurant d'entreprise");
$a4 = new agence("couscous","8 rue des saules",13000,"Marseille","Tickets Restaurant");
$a5 = new agence("marka","9 rue des aigrettes ",75000,"Paris","Tickets Restaurant");

//  les attributs pour les enfants d'employés
$ee1=new enfant("rahmouni","manel", 5);
$ee2= new enfant("mhiri","idriss",5);
$ee3= new enfant("morjene","yasmine",17);
$ee4= new enfant("mhiri","iliess",2);
?> 