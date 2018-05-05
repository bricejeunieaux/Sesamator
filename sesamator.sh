#!/bin/bash

##############################################################  ##############################################################
#     _____                                 _                #  #                                                            #
#    / ____|                               | |               #  #             GÉNÉRATEUR SIMPLE DE MOTS DE PASSE             #
#   | (___   ___  ___  __ _ _ __ ___   __ _| |_ ___  _ __    #  #                                                            #
#    \___ \ / _ \/ __|/ _` | '_ ` _ \ / _` | __/ _ \| '__|   #  #         Prototype actuel codé en script Bash Linux         #
#    ____) |  __/\__ \ (_| | | | | | | (_| | || (_) | |      #  #                                                            #
#   |_____/ \___||___/\__,_|_| |_| |_|\__,_|\__\___/|_|      #  #               Version uploadée : 0.0.0.0/d                 #
#                                                            #  #                                                            #
##############################################################  ##############################################################


#Auteur du projet source : Jeunieaux Brice	-	JeunieauxBrice@hotmail.fr	brice_jeunieaux@member.fsf.org (XMPP/Pidgin)
#Github du projet	 : https://github.com/bricejeunieaux/sesamator
#Licence GNU GPL v3	 : https://www.gnu.org/licenses/quick-guide-gplv3.fr.html






##############################  PARTIE 1 : PARAMÉTRAGE NON-IMPORTANTS	########################################
#####Ces paramétrages ne jouent pas un grand rôle dans le script (pas d'opérations)

initFenetre() {						#Dimensionnage fenêtre + effaçage

resize -s 35 125
clear

}

initFenetre ;

definitionCouleur() {					#Fonction pour faciliter la colorisation dans le script
							#à l'aide de variables contenant les "code-couleurs"
enDefaut='\033[0m' ;

fgBlanc='\033[37m' ;
fgCyan='\033[36m' ;
fgViolet='\033[35m' ;
fgBleu='\033[34m' ;
fgJaune='\033[33m' ;
fgVert='\033[32m' ;
fgRouge='\033[31m' ;
fgNoir='\033[30m' ;

bgBlanc='\033[47m' ;
bgCyan='\033[46m' ;
bgViolet='\033[45m' ;
bgBleu='\033[44m' ;
bgJaune='\033[43m' ;
bgVert='\033[42m' ;
bgRouge='\033[41m' ;
bgNoir='\033[40m' ;

enGras='\033[1m' ;
enSouligne='\033[4m' ;
enSurligne='\033[7m' ;

}

definitionCouleur ;






##############################  PARTIE 2 : PARAMÉTRAGES GÉNÉRAUX	########################################
#####Ces paramétrages concernent l'ensemble du programme, peu importe les méthodes de génération choisies.
#####Ces paramétrages, contenus dans des fonctions, sont appelés une unique fois pour faire fonctionner le programme jusqu'à son arrêt.

tableauxCaracteres() {
	
	lettersMin=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
	lettersMaj=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
	numbers=(0 1 2 3 4 5 6 7 8 9)
	specials=("!" "@" "#" "$" "%" "^" "&" "*" "(" ")" "_" "+" "\`" "~" "-" "=" "[" "]" "{" "}" ";" "'" ":" "\"" "," "." "/" "<" ">" "?" "\\" "|")
	
}

tableauxCaracteres ;






##############################  PARTIE 5 : MANUEL UTILISATEUR	########################################
#####Cette méthode génère de manière totalement aléatoire un mot de passe

manuelUtilisateur() {
	
	clear
	tput cup 1 0 ; echo -e "${enSouligne}${fgVert}Générateur de mots de passe / Version 0.1.0.0 / Comment utiliser le script ?${enDefaut}"
	tput cup 3 0 ; echo -e "Pour générer un mot de passe depuis le menu principal du script, vous pouvez avoir recours à différentes méthodes."
	
	echo
	echo -e "${fgJaune}${enSouligne}Méthode 1 : Totalement aléatoire :${enDefaut}"
	echo
	
	echo -e "Cette méthode va, indépendamment de la longueur du mot de passe voulu, placer des caractères choisis"
	echo -e "aléatoirement dans un tableau contenant un certain type de caractères, lui-même choisi aléatoirement."
	echo -e "Ainsi, avec cette méthode, vous pourrez vous retrouvez avec des mots de passes tels que :"
	echo -e "${fgRouge}'4x)&q9Ud{0'${enDefaut}, ${fgRouge}'4h1'${enDefaut}, ${fgRouge}'doXjrJe,P;'${enDefaut},  ${fgRouge}'wAyA[v'${enDefaut}, ou encore ${fgRouge}'7igqT3fF2)790eh&5P3oY;84'${enDefaut}."
	
	echo
	echo -e "${fgJaune}${enSouligne}Méthode 2 : Totalement personnalisé :${enDefaut}"
	echo
	
	echo -e "Avec cette méthode, vous pouvez choisir quel type de caractère (nombre, lettre, caractère spécial)"
	echo -e "se situera à quelle position dans votre mot de passe. Cette méthode est recommandée pour les mots de passe"
	echo -e "de longueur courte à moyenne. Du premier au dernier caractère, vous définirez son type."
	echo -e "Cela signifie qu'avec cette méthode, vous mettrez plus ou moins de temps à génerer le mot de passe selon sa longueur."
	echo -e "La dernière méthode est vivement recommandée pour les mots de passe longs et complets."
	
	echo
	echo -e "${fgJaune}${enSouligne}Méthode 3 : Personnalisé d'après un modèle :${enDefaut}"
	echo
	
	echo -e "Avec cette méthode, vous pourrez choisir entre différents modèles de mots de passe."
	echo -e "Par exemple, vous aurez le modèle 1 qui dira que sur 5 caractères dans un mot de passe, les 3 premiers sont des lettres,"
	echo -e "et les 2 restants sont des chiffres. Dans un modèle de mot de passe, il y aura donc un ou plusieurs motifs présents."
	echo -e "Ainsi, avec cette méthode, vous pourrez vous retrouvez avec des mots de passes tels que :"
	echo -e "'${fgCyan}ag${fgViolet}47${fgCyan}hn${fgViolet}33${fgCyan}xx${fgViolet}79${enDefaut}', '${fgCyan}14${fgViolet}ff${fgCyan}76${fgViolet}ha${enDefaut}', ou encore des mots de passe contenant trois motifs tels que '${fgCyan}1${fgViolet}f${fgVert}!${fgCyan}8${fgViolet}r${fgVert}\$${enDefaut}'."
	
	echo
	echo -e "Le but d'un motif qui se répète dans un mot de passe est d'être retenu mentalement plus rapidement et plus aisément."
	echo -e "Avec des mots de passe contenant des motifs, vous pourrez donc générer de longs mots de passes facile à mémoriser."
	echo -e "Bien entendu, il n'est pas forcément pertinent d'utiliser des mots de passe de 10000 caractères, bien que cela soit"
	echo -e "tout à fait réalisable par le programme."
	
	tput cup 33 0 ; echo -e "${enSouligne}${fgVert}Appuyez sur n'importe quelle touche pour retourner au menu principal"
	tput cup 33 70 ; read -rsn1 var
	
	menuPrincipal ; getTouche ;
	
}






##############################  PARTIE 3 : MENU PRINCIPAL DU SYSTÈME	########################################
#####Cette partie contient uniquement le menu où l'utilisateur pourra être redirigé selon ses choix de génération de MDP

menuPrincipal() {
	
	clear
	tput cup 1 0 ; echo -e "${enSouligne}${fgVert}Générateur de mots de passe / Version 0.1.0.0${enDefaut}"
	tput cup 3 0 ; echo -e "[1] Générer un/plusieurs mot(s) de passe complètement aléatoire(s)"
	tput cup 4 0 ; echo -e "[2] Générer un/plusieurs mot(s) de passe personnalisé(s)"
	tput cup 5 0 ; echo -e "[3] Générer un/plusieurs mot(s) de passe d'après un modèle"
	
	tput cup 7 0 ; echo -e "[4] Comment utiliser ce script ?"
	tput cup 8 0 ; echo -e "[5] Quitter ce script"
	tput cup 10 0 ;
	
}

menuPrincipal ;

function getTouche() {
	
	escape_char=$(printf "\u1b")
	read -rsn1 mode # get 1 character
	
	if	[[ $mode == $escape_char ]]
	then	read -rsn2 mode # read 2 more chars
	fi
	
	case $mode in
		1) echo "Fonction pas encore implémentée." ; sleep 3 ; menuPrincipal ; getTouche ;;
		2) echo "Fonction pas encore implémentée." ; sleep 3 ; menuPrincipal ; getTouche ;;
		3) echo "Fonction pas encore implémentée." ; sleep 3 ; menuPrincipal ; getTouche ;;
		4) manuelUtilisateur ; getTouche2 ;;
		5) clear ; exit ;;
		*) >&2 echo 'Veuillez entrez un nombre entre 1 et 5.'; sleep 1 ; clear ; menuPrincipal ; getTouche ;;
	esac
	
}

getTouche ;






##############################  PARTIE 6 : MÉTHODE DE GÉNÉRATION ALÉATOIRE	########################################













