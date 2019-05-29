## d�tection de l�sions sur image couleur
## phase 1 : apprentissage � partir d'images �chantillonn�es
## path.sample est le r�pertoire contenant les r�pertoires des classes d'�channtillons
## le r�pertoire path.sample peut contenir d'autres sous-r�pertoires inutilis�s
## chaque r�pertoire de classe contient un ou plusieurs sous-r�pertoires contenant les ficiers images d'apprentissage
## les trois derniers arguments de la fonction apprentissage sont les noms des 3 r�pertoires des classes: fond, limbe, l�sion (dans cer ordre)

source("training_functions_V6.r")

## Choisir Exemple1 ou Exemple2
path.sample <- "../Exemple1/Samples"
path.sample <- "../Exemple2/Samples"
path.sample <- "../Exemple2/Samples2"
path.sample <- "../Exemple_Thomas/Samples"
path.sample <- "../Exemple_Mathias/Samples1"
path.sample <- "../Exemple_Mathias/Samples2"
path.sample <- "../Exemple_Mathias/Samples_feuille_riz"
path.sample <- "D:/BGPI/BecPhy/Babeth/AnalyseImages/AnalyseImagesV4/Exemple2_Stella/Samples"
path.sample <- "../Exemple_Seb_banane/Samples"
path.sample <- "../Exemple_Seb_banane/Samples2"
.path.sample <- "../Exemple2_Stella/Samples"
path.sample <- "../Exemple_Dominique/GT1 stade C recto verso/Samples"

path.sample <- "../Exemple_Dominique/Anthracnose/Samples/Inf"
path.sample <- "../Exemple_Dominique/Anthracnose/Samples/Sup"

path.sample <- "../Exemple_Dominique/CLFD/Samples/Inf"
path.sample <- "../Exemple_Dominique/CLFD/Samples/Sup"

training(.path.sample,"fond","limbe","lesion")
training(path.sample,"fond","limbe","lesion",transform=function(x) log1p(x),colormodel="rgb",method="svm")
training(path.sample,"fond","limbe","lesion",colormodel="hsv",method="lda")
training(path.sample,"fond","limbe","lesion",transform=function(x) (sin(pi*(x-0.5))+1)/2,method="qda")
training(path.sample,"fond","limbe","lesion",transform=function(x) asin(2*x-1)/pi+0.5)
training(path.sample,"fond","limbe","lesion",transform=log1p)

## Fin de fichier

fond <- "fond"
limbe <- c("limbe")
lesion <- c("lesion")
