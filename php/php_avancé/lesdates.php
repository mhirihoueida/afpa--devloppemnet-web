<?php 
//Exercice 1
//Affichez la date du jour au format mardi 2 juillet 2019.
echo 'exercice 1 : ';
echo date('l j F Y');
?>
<br>
<?php
//Exercice 2
//Trouvez le numéro de semaine de la date suivante : 14/07/2019.
echo 'exercice 2 : ';

$DateDisplay = '2019-07-14' ;
echo 'Semaine' . date('W',strtotime($DateDisplay)) . ' de ' . date('o',strtotime($DateDisplay));
//L’option « o » de la fonction date() renvoie l’année correspondant à la semaine et non de la date
?>
<br>
<?php 

//Exercice 4
//Reprenez l'exercice 3, mais traitez le problème avec les fonctions de gestion du timestamp, time() et mktime().
echo 'exercice 4 : ';
$origin = new DateTime('2021-09-08');//date de jour 
$target = new DateTime('2022-01-14');// date de la fin de la formation 
$interval = $origin->diff($target);// calculer l'intervalle  entre origin et target .
echo $interval->format('%R%a days');//afficher le résultat sous la forma :+ (intervalle) days 
?> 
<br>
<?php
//Exercice 5
//Quelle sera la prochaine année bissextile ?
echo 'exercice 5 : ';
function bissextile($annee) {
	if( (is_int($annee/4) && !is_int($annee/100)) || is_int($annee/400)) {
			
		return TRUE;
	} else {
		
		return FALSE;
	}
}
echo date('Y') . ' ';//récuperer l'année de notre date actuelle .
echo bissextile(date('Y')) ? 'est ' : 'n\'est pas';
// ici on fait appelle à notre function bissextille , et on prend comme variable $annee= date('y'), le retour de cette function est soit  true(donc on prend le message 'est') ou soit flase (donc on prend le message 'n'est pas') .
echo ' bissextile.';
?>
<br>
<?php
//Exercice 6
//Montrez que la date du 17/17/2019 est erronée.
echo 'exercice 6 : ';
$datePattern = " !^(0?\d|[12]\d|3[01])-(0?\d|1[012])-((?:19|20)\d{2})$!";// regex-pour-le-format-de-date-dd-mm-yyyy
$date = "17/17/2019";
//preg_match — Effectue une recherche de correspondance avec une expression rationnelle standard
if (preg_match($datePattern, $date) )
{
    echo"Date ".$date." valide.<br>";
}
else 
{
    echo"Date ".$date." erronée.<br>";
} 

?>
<br>
<?php
//Exercice 7
//Affichez l'heure courante sous cette forme : 11h25.

//Y : année sur 4 chiffres, ex: 2012
//y : année sur 2 chiffres, ex: 12
//m : numéro du mois courant
//d : jour du mois
//H : heure sur 24 heures
//i : minutes
//s : secondes
//F : nom du mois (en toutes lettres)

echo 'exercice 7 : ';
echo date('H:i' );?>
<br>
<?php
//Exercice 8
//Ajoutez 1 mois à la date
echo 'exercice 8 : ';
$maDate = "2021-09-08";
$maDate = date("Y-m-d", strtotime("+1 month", strtotime($maDate." " )));
// la fonction strtotime , elle transforme un texte anglais en timestamp , puis elle retourne un timestamp en cas de succès,(sa format :strtotime(time, now)).
echo "$maDate";  
?>









































