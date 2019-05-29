## d�tection de l�sions sur image couleur
## phase 2 : analyse d'image

source("analysis_functions_V6.r")

## -------------------- Param�tres de l'analyse -----------------------------------
.leaf.area.min <- 1000 ## surface minimum d'une feuille
.leaf.border <- 3 ## �paisseur de bordure de feuille � supprimer
.lesion.border <- 3 ## �paisseur de bordure de l�sion � dilater / �roder
.lesion.area.min <- 10 ## surface minimum d'une l�sion
##surface.lesion.maxi <- 12000 ## surface maximum d'une l�sion
.lesion.area.max <- 10000 ## surface maximum d'une l�sion
.lesion.eccentricity.max <- 0.999 ## excentricit� maximum d'une l�sion
.lesion.color <-  1 ## couleur des l�sions dans l'image analys�e (0=noir, 1=blanc)
.blur.diameter <- 5 ## flou si valeur > 1 (valeur impaire)

## -------------------- R�pertoires et fichiers Exemple_Dominique---------------------------
path.sample <- "../Exemple_Dominique/GT1 stade C recto verso/Samples" ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple_Dominique/GT1 stade C recto verso/Result"  ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
path.image <- "../Exemple_Dominique/GT1 stade C recto verso/Images"   ## R�pertoire de stockage des fichiers images sources
##file.image <- "IMG_5583_50.jpg"      ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple_Dominique---------------------------
path.sample <- "../Exemple_Dominique/GT1 stade D Recto Verso/Samples" ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple_Dominique/GT1 stade D Recto Verso/Result"  ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
path.image <- "../Exemple_Dominique/GT1 stade D Recto Verso/Images"   ## R�pertoire de stockage des fichiers images sources
##file.image <- "IMG_5583_50.jpg"      ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple_Dominique ---------------------------
path.sample <- "../Exemple_Dominique/PB317 stadeC note 0�4 recto verso/Samples" ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple_Dominique/PB317 stadeC note 0�4 recto verso/Result"  ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
path.image <- "../Exemple_Dominique/PB317 stadeC note 0�4 recto verso/Images2"   ## R�pertoire de stockage des fichiers images sources
##file.image <- "IMG_5583_50.jpg"      ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple_Dominique anthracnose face inf�rieure ---------------------------
path.sample <- "../Exemple_Dominique/Anthracnose/Samples/Inf"
path.result <- "../Exemple_Dominique/Anthracnose/Result/Inf"
path.image <- "../Exemple_Dominique/Anthracnose/Images_2"
file.image <- "IRCA18_ANT_score2_2_abaxial_stade C_2.jpg"

## -------------------- R�pertoires et fichiers Exemple_Dominique anthracnose face sup�rieure ---------------------------
path.sample <- "../Exemple_Dominique/Anthracnose/Samples/Sup"
path.result <- "../Exemple_Dominique/Anthracnose/Result/Sup"
path.image <- "../Exemple_Dominique/Anthracnose/Images_2"
file.image <- "IRCA18_ANT_score2_2_adaxial_stade C_2.jpg"

## -------------------- R�pertoires et fichiers Exemple_Dominique CLFD  face inf�rieure ---------------------------
path.sample <- "../Exemple_Dominique/CLFD/Samples/Inf"
path.result <- "../Exemple_Dominique/CLFD/Result/Inf"
path.image <- "../Exemple_Dominique/CLFD/Images_2"
file.image <- "IRCA18_CLFD_score2_1_Abaxial_2.jpg"

## -------------------- R�pertoires et fichiers Exemple_Dominique CLFD  face sup�rieure ---------------------------
path.sample <- "../Exemple_Dominique/CLFD/Samples/Sup"
path.result <- "../Exemple_Dominique/CLFD/Result/Sup"
path.image <- "../Exemple_Dominique/CLFD/Images_2"
file.image <- "IRCA18_CLFD_score2_1_Adaxial_2.jpg"

## -------------------- R�pertoires et fichiers Exemple1---------------------------
path.sample <- "../Exemple1/Samples" ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple1/Result"  ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
path.image <- "../Exemple1/Images"   ## R�pertoire de stockage des fichiers images sources
file.image <- "IMG_5583_50.jpg"      ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple2 --------------------------
path.sample <- "../Exemple2/Samples"   ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple2/Result"    ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
path.image <- "../Exemple2/Images"     ## R�pertoire de stockage des fichiers images sources
file.image <- "pCR17-6-1_kitaake3.jpg" ## Fichier image source

path.sample <- "../Exemple2/Samples2"   ## R�pertoire de stockage des fichiers �chantillons
file.image <- "Mock1.jpg" ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple_Thomas --------------------------
path.sample <- "../Exemple_Thomas/Samples"   ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple_Thomas/Result"    ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
path.image <- "../Exemple_Thomas/Images"     ## R�pertoire de stockage des fichiers images sources
file.image <- "010_repdo5_dpi40_4.jpg" ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple_Mathias --------------------------
path.sample <- "../Exemple_Mathias/Samples1"   ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple_Mathias/Result1"    ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)

path.sample <- "../Exemple_Mathias/Samples2"   ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple_Mathias/Result2"    ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)

path.image <- "D:/BGPI/BecPhy/Babeth/AnalyseImages/Exemples/Mathias/Images"
##path.image <- "../Exemple_Mathias/Images"     ## R�pertoire de stockage des fichiers images sources
file.image <- "d�marche1.jpg" ## Fichier image source
file.image <- "feuille_riz.jpg" ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple_Seb_banane --------------------------
path.sample <- "../Exemple_Seb_banane/Samples2"   ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple_Seb_banane/Result2"    ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
path.image <- "D:/BGPI/BecPhy/Babeth/AnalyseImages/Exemples/Seb_banane/Images"     ## R�pertoire de stockage des fichiers images sources
file.image <- "008_repdo5_dpi40_1.jpg" ## Fichier image source
file.image <- "18_cuba5_dpi42_2.jpg" ## Fichier image source
file.image <- "18_cuba5_dpi42_4.jpg" ## Fichier image source
file.image <- "046_repdo5_dpi40_4.jpg" ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple_Seb_riz --------------------------
path.sample <- "../Exemple_Seb_riz/Samples"   ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple_Seb_riz/Result"    ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
path.image <- "../Exemple_Seb_riz/Images"     ## R�pertoire de stockage des fichiers images sources
file.image <- "Mock1.jpg" ## Fichier image source
file.image <- "Chi_P01_1_V2.jpg" ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple_Stella --------------------------
.path.sample <- "../Exemple2_Stella/Samples"   ## R�pertoire de stockage des fichiers �chantillons
.path.result <- "../Exemple2_Stella/Result"    ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
.path.image <-  "D:/BGPI/BecPhy/Babeth/AnalyseImages/Exemples/Stella/Images"     ## R�pertoire de stockage des fichiers images sources
.file.image <- "pCR17-6-1_kitaake3.jpg" ## Fichier image source
file.image <- "pCR17-6-1_kitaake_2.jpg" ## Fichier image source

## -------------------- R�pertoires et fichiers Exemple_Babeth --------------------------
path.sample <- "../Exemple_Babeth/apprentissage"   ## R�pertoire de stockage des fichiers �chantillons
path.result <- "../Exemple_Babeth/Result"    ## R�pertoire de stockage des r�sultats d'analyse, cr�� si inexistant (peut �tre le m�me que path.image)
path.image <-  "../Exemple_Babeth/Images"     ## R�pertoire de stockage des fichiers images sources
file.image <- "CH1857_rep1_2_25.jpg" ## Fichier image source

## -------- Exemple analyse par passage des noms de fichier -----------------------
analyse.image(path.sample=.path.sample,
              path.result=.path.result,
              path.image=.path.image,
              file.image=c(.file.image), ## peut contenir plusieurs noms
              leaf.area.min=.leaf.area.min,
              leaf.border=.leaf.border,
              lesion.border=.lesion.border,
              lesion.area.min=.lesion.area.min,
              lesion.area.max=.lesion.area.max,
              lesion.eccentricity.max=.lesion.eccentricity.max,
              lesion.color=.lesion.color,
              blur.diameter=.blur.diameter)
## ------------- Fin d'analyse ----------------------------------------------------

## -------- Exemple analyse d'un r�pertoire complet -------------------------------
analyse.image(path.sample=.path.sample,
              path.result=.path.result,
              path.image=.path.image,
              file.image=NA, ## analyse du r�pertoire complet
              leaf.area.min=.leaf.area.min,
              leaf.border=.leaf.border,
              lesion.border=.lesion.border,
              lesion.area.min=.lesion.area.min,
              lesion.area.max=.lesion.area.max,
              lesion.eccentricity.max=.lesion.eccentricity.max,
              lesion.color=.lesion.color,
              blur.diameter=.blur.diameter)
## ------------- Fin d'analyse ----------------------------------------------------

## ----------------- Fin de fichier -----------------------------------------------
