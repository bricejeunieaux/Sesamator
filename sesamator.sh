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

resize -s 35 120
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






##############################  PARTIE 2 : MENU PRINCIPAL DU SYSTÈME	########################################
#####Cette partie contient uniquement le menu où l'utilisateur pourra être redirigé selon ses choix de génération de MDP

menuPrincipal() {
	
	clear
	tput cup 1 0 ; echo -e "${enSouligne}${fgVert}Générateur de mots de passe / Version 0.1.0.0${enDefaut}"
	tput cup 3 0 ; echo -e "[1] Générer un mot de passe complètement aléatoire"
	tput cup 4 0 ; echo -e "[2] Générer un mot de passe personnalisé"
	tput cup 5 0 ; echo -e "[3] Générer un mot de passe d'après un modèle"
	
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
		4) echo "Fonction pas encore implémentée." ; sleep 3 ; menuPrincipal ; getTouche ;;
		5) clear ; exit ;;
		*) >&2 echo 'Veuillez entrez un nombre entre 1 et 5.'; sleep 1 ; clear ; menuPrincipal ; getTouche ;;
	esac
	
}

getTouche ;

