<?php 
class Personnage {
private $_nom;
private $_prenom;
private $_age;
private $_sexe;

public function _construct($_nom,$_prenom,$_age,$_sexe){
    $this->nom=$_nom;
    $this->prenom=$_prenom;
    $this->age=$_age;
    $this->sexe=$_sexe;
}

public function getNom(){
    return $this->nom;
}
public function setNom($_nom){
    $this->nom=$_nom;
}
public function getPrenom(){
    return $this->prenom;
}
public function setPrenom($_prenom){
    $this->prenom=$_prenom;
}
public function getAge(){
    return $this->age;
}
public function setAge($_age){
    $this->age=$_age;
}
public function getSexe(){
    return $this->sexe;
}
public function setSexe($_sexe){
    $this->sexe=$_sexe;
}
}

//
$p=new Personnage("Mhiri","houeida",32,"feminin");
$p->setNom ("Mhiri");
$p->setPrenom("houda");
$p->setAge("42");
$p->setSexe("feminin");

/*echo $p->getNom(); 
echo $p->getPrenom();
echo $p->getAge();
echo $p->getSexe();*/

?>