<?php
if (file_exists("entete.php") ) 
{
    include("entete.php");
} 
else 
{
  // Erreur (afficher un message ou redirection)
} 
?>


<body>
    <div class="container">
        <header>
            <div class="d-sm-none d-lg-block">
                <div class="row">
                    <div class="col-8">
                        <img src="images/jarditou_logo.jpg" alt="jarditou_logo" width="150">
                    </div>
                    <div class="col-4">
                        <h2 class="text-center">Tout le jardin</h2>
                    </div>
                </div>
            </div>
        </header>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="#">Jarditou.com</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                            <li class="nav-item active">
                                <a class="nav-link" href="acceuilbootstrap.html">Acceuil<span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="tableaubootstrap.html">Tableau</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contactbootstrap.html">Cantact</a>
                            </li>
                        </ul>
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="text" placeholder="Votre promotion">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Rechercher</button>
                        </form>
                    </div>
                </nav>
                <img src="images/promotion.jpg" alt="promotion" width="100%">
                <div class="row shadow p-0 mb-3 bg_body rounded" style="margin:auto">
                    <div class="col-lg-8 fs-5 col-xs-12">
                        <article>
                            <h2>l'entreprise</h2>
                            <p style="font-size: 17px;">Notre entreprise familiale met tous son savoir-faire à votre disposition dans le domaine du jardin et du paysagisme.</p>
                            <p style="font-size: 17px;">Créée il y a 70 ans, notre entreprise vend fleurs, arbustes, matériel à main et motorisés.</p>
                            <p style="font-size: 17px;">Implantés à Amiens, nous intervenons dans tout le département de la Somme:Albert, Doullens, Péronne, Abbville, Corbie</p>
                        </article>
                        <article>
                            <h2>Qualité</h2>
                            <p style="font-size: 17px;">Nous mettons à votre disposition un service personnalisé, avec 1 seul interlocuteur durant tout votre projet.</p>
                            <p style="font-size: 17px;">Vous serez sèduit par expertise, nos compètences et notre sèrieux</p>
                        </article>
                        <article>
                            <h2>Devis gratuit</h2>
                            <p style="font-size: 17px;">Vous pouvez bien sûr contacter pour de plus amples informations ou pour une demande d'intervention. Vous souhaitez un devis? Nous vous le r&#232;alisons gratuitement.</p>
                        </article>
                    </div>
                    <div class="col-lg-4 bg-warning col-xs-12 px-0">
                        <p class="fs-3 text-center"> [COLONE DROITE]</p>
                    </div>
                </div>
                <footer>
                    <ul class="nav bg-dark" style="margin:auto">
                        <li class="nav-link text-muted">mention légale</li>
                        <li class="nav-link text-muted">horaire</li>
                        <li class="nav-link text-muted">plan du site</li>
                    </ul>
                </footer>

                <?php
if (file_exists("pieddepage.php") ) 
{
    include("pieddepage.php");
} 
else 
{
    // Erreur (afficher un message ou redirection)
} 
?>