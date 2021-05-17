#!/bin/bash
clear
matrix ()
{
     clear 
    cmatrix -ab 
}
showlist ()
{
    echo -e "\e[1;1m OpTioNs ARE : \n"
    echo -e "\e[1;31m1) ProsseC ManageMent\n""2) ALL AbouT THIS SiTUation\n""3) LoGsView\n\e[0m";
    echo -e "\e[1;32m4) MATRIX\n""5) UpdaTe & UPgraDe\n""6) USERS\n\e[0m";
    echo -e "\e[1;35m7) Date & CalEnDer \n""8) PhoNeBOOK\n""9) CaLc\n\e[0m"; 
    echo -e "\e[1;36m10) TaLk\n""11) cLeaR\n""12) AbouT\n\e[0m" ;
    echo -e "\e[1;1m13) EXIT\e[0m"; 
}
ProcMNG ()
{
    select CHOICE in "htOp" "proCCes View" "KiLL PRoC" "tree OF proccess" "ParenT Procces" "SySCTL" "BaCk";
    do 
        case $REPLY in
            1)
                htop
            ;;
            2)
		        read -p "MosT RaM usIng OR CPU (r/c) ?: " ans3
		        if   [ $ans3 == r ] ; then 
                    if [ ! -e /tmp/100Tools ] ; then
                        mkdir /tmp/100Tools
                    else
                         echo ""
                    fi
                    if [ ! -e /tmp/100Tools/proccessRR ]; then
                        touch /tmp/100Tools/proccessRR
                    else
                         echo ""
                    fi
                    echo -e "PID\t" "RamUsage\t" "Program\n"  
                    ps -aux | sort -k 3n | tail -n 10 > /tmp/100Tools/proccessRR
                    awk ' BEGIN {OFS="\t"} {print $2 , $3 , $11} ' /tmp/100Tools/proccessRR
		         elif [ $ans3 == c ] ; then 
                    if [ ! -e /tmp/100Tools ] ; then
                        mkdir /tmp/100Tools
                    else
                         echo ""
                    fi
                    if [ ! -e /tmp/100Tools/proccessCC ]; then
                        touch /tmp/100Tools/proccessCC
                    else
                         echo ""
                    fi
                    echo -e "PID\t" "CPUUsage\t" "Program\n" 
			        ps -aux | sort -k 4n | tail -n 10 > /tmp/100Tools/proccessCC 
                    awk ' BEGIN {OFS="\t \t"} {print $2 , $4 , $11} ' /tmp/100Tools/proccessCC
		          else 	
			        echo "InCOrect Choice....."
	    	    fi
            ;;
            3)
                read -p " Enter PID PlZ : " PID
                kill $PID
            ;;
            4)
                read -p " All ProcS or Defined ProcS (a/d) ? : " aord
                if [ $aord == "a" ]; then
                     pstree | more
                elif [ $aord == "d" ]; then
                     read -p "What IS ThE NaMe OF PRoCCess ?: " $1
                     pstree | grep "$1"
                else
                     echo "doNt KnoW whAt U doin !"
                     break
                fi
            ;;
            5)
                read -p "Enter The naMe Of ProCCess " name
                ps -j $name
            ;;
            6)
                select CHOICE in "DefaUlt KerNEL TyPe" "ChanGe KeRnEl TyPe" "UNITS" "StarT OR StoP" "BaCk" ;
                do
                    case $REPLY in
                        1)
                            echo `systemctl get-default`
                        ;;
                        2)
                            select CHOICE in "EmeRgenCy TargeT" "GraPhiCal TarGet" "MuLti-User TarGeT" "ResCue TaRgeT" ;
                            do
                                case $REPLY in
                                    1)
                                        read -p "yoU select $REPLY , Are yOu sUre (y/n) ?: " ans4
                                        if [ $ans4 == y ]; then
                                             sudo systemctl isolate emergency.target
                                        elif [ $ans4 == n ]; then
                                             break
                                             exit 0
                                        else
                                             echo "OK not Sure WHAT u saYin"
                                             break
                                             exit 0
                                        fi
                                    ;;
                                    2)
                                        read -p "yoU select $REPLY , Are yOu sUre ?: " ans4
                                        if [ $ans4 == y ]; then
                                             sudo systemctl isolate graphical.target
                                        elif [ $ans4 == n ]; then
                                             break
                                             exit 0
                                        else
                                             echo "OK not Sure WHAT u saYin"
                                             break
                                             exit 0
                                        fi
                                    ;;
                                    3)
                                        read -p "yoU select $REPLY , Are yOu sUre ?: " ans4
                                        if [ $ans4 == y ]; then
                                             sudo systemctl isolate multi-user.target
                                        elif [ $ans4 == n ]; then
                                             break
                                             exit 0
                                        else
                                             echo "OK not Sure WHAT u saYin"
                                             break
                                             exit 0
                                        fi
                                    ;;
                                    4)
                                        read -p "yoU select $REPLY , Are yOu sUre ?: " ans4
                                        if [ $ans4 == y ]; then
                                             sudo systemctl isolate rescue.target
                                        elif [ $ans4 == n ]; then
                                             break
                                             exit 0
                                        else
                                             echo "OK not Sure WHAT u saYin"
                                             break
                                             exit 0
                                        fi
                                    ;;
                                    *)
                                        echo "InCorreCt ChOiCe...."
                                    ;;
                                esac
                                
                            done
                        ;;
                        3)
                            echo "case 1"
                        ;;
                        4)
                            echo "case 2 or 3"
                        ;;
                        5) 
                            break
                        ;;
                        *)
                            echo "LOl What U sayin ?"
                            break
                        ;;
                    esac
                    
                done   
            ;;
            7) 
                break   
            ;;
            *)
                echo "iNcoRecT ChOiCe"
            ;;
        esac
        
    done
}
AllAbout()
{
    select CHOICE in "WHO are YOU" "WhaTs UP" "NEO FeTcH" "BAcK"
    do
        case $REPLY in
            1)
                whoami
            ;;
            2)
                uname -arv
            ;;
            3) 
                neofetch
            ;;
            4) 
                break
                clear
                showlist
            ;;
            *)
                echo "I Dont KnOW"
                break 
                exit 1
            ;;
        esac
        
    done
}
LoGs()
{
    select CHOICE in "AuTH LOG" "BOOT LOG" "KErNeL LOG" "SYS LOG" "USR LOG" "DaEmoN LOG" "BaCK"
    do
        case $REPLY in
            1)
                sudo tail -n 30 /var/log/auth.log
            ;;
            2)
                sudo tail -n 30 /var/log/boot.log
            ;;
            3)
                sudo tail -n 30 /var/log/kern.log
            ;;
            4)
                sudo tail -n 30 /var/log/syslog
            ;;
            5)
                sudo tail -n 30 /var/log/user.log
            ;;
            6)
                sudo tail -n 30 /var/log/daemon.log
            ;;
            7)
                break
                clear
                showlist
            ;;
            *)
                echo "IncOrecT ChOiCe...."
                break
                exit 1
            ;;
        esac
        
    done
}
Update()
{
    select CHOICE in "All OF REPosiTory" "sPecifiC progRAM" "uPgraDe"  "seArCH Your ProGraM" "BACK"
    do
        case $REPLY in
            1)
                read -p "UPdating all RePOSITOries ?(y/n) :" ans5
                    if [ $ans5 == y ]; then
                         `sudo apt-get update`
                    elif [ $ans5 == n ]; then
                         break 
                    else
                        echo "wronG CHoiCe"
                        break
                    fi
            ;;
            2)
                read -p "PLEASE insert the NAME of THE PRogrAM : " ans6
                `sudo apt-get upgrade $ans6`
            ;;
            3)
                read -p "UpgRading all RePOSITOries ?(y/n) :" ans7
                    if [ $ans7 == y ]; then
                        `sudo apt-get upgrade`
                    elif [ $ans7 == n ]; then
                         break
                    else
                         echo "wronG CHoiCe"
                         break
                    fi
            ;;
            4)
                read -p "please insert THE name OF the Program" ans8
                `sudo apt search $ans8`
            ;;
            5)
                clear
                break
                showlist
            ;;
            *)
                break
            ;;
        esac
        
    done
}
PhoNeBOOK()
{
    DATABASENAME=".personalContact.db"
    CREATESQL='CREATE TABLE CONTACT(ID INTEGER PRIMARY KEY AUTOINCREMENT,NAME VARCHAR(30),FAMILY VARCHAR(40),MOBILEPHONE INTEGER,HOMEPHONE INTEGER,MAIL VARCHAR(70),DEL INTEGER);'
    SQLITEPATH='/usr/bin/sqlite3'
    clear

    if [ ! -e $SQLITEPATH ]
    then
        echo "First Install SQLITE3..."
        exit 1
    fi

    if [ ! -e $DATABASENAME ]
    then
    echo $CREATESQL | sqlite3 $DATABASENAME
    fi

    insert ()
    {
    clear
    echo "Each CONTACT Need Below Requirement : (* is Necessary) "
    echo "CONTACT Name(*),CONTACT FAMILY(*),CONTACT MOBILEPHONE(*),CONTACT HOMEPHONE(*),CONTACT e-MAIL(*)"
    echo -e "-----------------------------------------"
    CONDITION=true
    while [ $CONDITION == "true" ]
    do
        _dataValidationCheck=0
        _dataDuplicationCheck=0
        read -p "Enter CONTACT Name : " NAME
        read -p "Enter CONTACT FAMILY : " FAMILY
        read -p "Enter CONTACT Mobile Number Like (+98935***1212) : " MOBILEPHONE
        read -p "Enter CONTACT Home Number Like (02332904567) : " HOMEPHONE
        read -p "Enter CONTACT E-MAIL : " MAIL

        datavalidationcheck
        datadublicationcheck

        if [ $_dataValidationCheck -eq 0 -a $_dataDuplicationCheck -eq 0 ]
        then
        rowCount=`echo "SELECT COUNT(*) FROM CONTACT;" | sqlite3 $DATABASENAME`
        rowCount=$((rowCount+1))
        echo "INSERT INTO CONTACT VALUES('$rowCount','$NAME','$FAMILY','$MOBILEPHONE','$HOMEPHONE','$MAIL','0');" | sqlite3 $DATABASENAME
        if [ $? -eq 0 ]
        then
            echo "Insert Complete..."
            sleep 1
        fi
        fi

        read -p "Do You Want To Continue ? (yes/no) " ans
        if [[ $ans == "yes" ]]
        then
        continue
        else
        CONDITION=false
        fi
    done
    }
    datavalidationcheck ()
    {

    NAME=`echo "${NAME,,}"`
    FAMILY=`echo "${FAMILY,,}"`
    MAIL=`echo "${MAIL,,}"`

    if [[ ! $NAME =~ ^[a-z][0-9a-z]*$ ]]
    then
        _dataValidationCheck=1
        echo "Name Not Accept..."
    fi

    if [[ ! $FAMILY =~ ^[a-z][0-9a-z]*$ ]]
    then
        _dataValidationCheck=1
        echo "FAMILY Not Accept..."
    fi

    if [[ ! $MOBILEPHONE =~ ^\+98[9]{1}[0-9]{9}$ ]]
    then
        _dataValidationCheck=1
        echo "Mobile Phone Not Accept..."
    fi

    if [[ ! $HOMEPHONE =~ ^\0[1-9][1-9]{1}[0-9]{8}$ ]]
    then
        _dataValidationCheck=1
        echo "HOME Phone Not Accept..."
    fi

    if [[ ! $MAIL =~ [a-z0-9._-]+@[a-z0-9.-]+\.[a-z]{2,4} ]]
    then
        _dataValidationCheck=1
        echo "EMAIL Not Accept..."
    fi
    }
    datadublicationcheck ()
    {
    recordName=`echo "SELECT NAME FROM CONTACT WHERE FAMILY = '$FAMILY' AND NAME = '$NAME' AND DEL = '0';"| sqlite3 $DATABASENAME`
    if [[ -n $recordName ]]
    then
        _dataDuplicationCheck=1
        echo "Contact Family & Name is Duplicated...."
    fi
    }

    showlist1 ()
    {
    rowCount=`echo "SELECT COUNT(*) FROM CONTACT;" | sqlite3 $DATABASENAME`
    if [[ $rowCount -ne 0 ]]
    then
        clear
        echo "Database CONTACT Content : "
        echo "----------------------------------"
        echo "SELECT ID,NAME,FAMILY,MOBILEPHONE,HOMEPHONE,MAIL FROM CONTACT WHERE DEL = '0';" | sqlite3 $DATABASENAME
        echo -e "----------------------------------\n"
    else
        echo "Database Is Empty..."
    fi
    }

    searchContact ()
    {
    contactRecordID=0
    echo "Find CONTACT : "
    read -p "Enter Your Contact Family : " searchFamily
    read -p "Enter Your Contact Name : " searchName

    contactRecordID=`echo "SELECT ID FROM CONTACT WHERE FAMILY = '$searchFamily' AND NAME = '$searchName' AND DEL = '0';" | sqlite3 $DATABASENAME`
    return $contactRecordID
    }

    modifyContact ()
    {
    modifyContactRecordID=0
    echo "You Are Modify This CONTACT : "
    echo "SELECT NAME,FAMILY,MOBILEPHONE,HOMEPHONE,MAIL FROM CONTACT WHERE ID = '$1';" | sqlite3 $DATABASENAME
    echo -e "\n---------------------------------------"
    read -p "Enter CONTACT New Name : " NAME
    read -p "Enter CONTACT New FAMILY : " FAMILY
    read -p "Enter CONTACT New Mobile Number Like (+98935***1212) : " MOBILEPHONE
    read -p "Enter CONTACT New Home Number Like (02332904567) : " HOMEPHONE
    read -p "Enter CONTACT New E-MAIL : " MAIL
    _dataValidationCheck=0
    _dataDuplicationCheck=0
    datavalidationcheck
    datadublicationcheck
    if [ $_dataValidationCheck -eq 0 -a $_dataDuplicationCheck -eq 0 ]
    then
        echo "UPDATE CONTACT SET NAME='$NAME',FAMILY='$FAMILY',MOBILEPHONE='$MOBILEPHONE',HOMEPHONE='$HOMEPHONE',MAIL='$MAIL' WHERE ID = '$1';" | sqlite3 $DATABASENAME
        echo "Contact Modified..."
    fi
    }
    deleteContact ()
    {
    echo "You Are Deleting This Contact : "
    echo "SELECT ID,NAME,FAMILY,MOBILEPHONE,HOMEPHONE,MAIL FROM CONTACT WHERE ID='$1';" | sqlite3 $DATABASENAME
    echo -e "-----------------------------------\n"
    read -p "Are you Sure ?? (yes/no)" ans2
    if [[ $ans2 == "yes" ]]
    then
        echo "UPDATE CONTACT SET DEL =1 WHERE ID='$1';"|sqlite3 $DATABASENAME
        echo "Contact Deleted..."
        sleep 1
    else
        echo "Contact Not Deleted..."
    fi
    }
    show ()
    {
    echo "CONTACT Personal NoteBook"
    echo -e "-----------------------------------\n"
    echo "Operation is : "
    echo "1) Insert Contact  3) Modify Contact   5) Clear Screen"
    echo "2) List Contacts   4) Delete Contact   6) Exit"
    }

    echo -e "Personal Contact Notebook"
    echo -e "---------------------------------------\n"
    echo -e "Operation is : \n"
    select choice in "Insert Contact" "List Contact" "Modify Contact" "Delete Contact" "Clear Screen" "Exit"
    do
    case $REPLY in
        1)
        insert
        show
        ;;
        2)
        showlist1
        show
        ;;
        3)
        searchContact
        returnValue=`echo $?`
        if [[ $returnValue -ne 0 ]]
        then
            modifyContact $returnValue
        else
            echo -e "Contact Not Found\n"
        fi
        show
        ;;
        4)
        searchContact
        returnValue=`echo $?`
        if [[ $returnValue -ne 0 ]]
        then
            deleteContact $returnValue
        else
            echo -e "Contact Not Found\n"
        fi
        show
        ;;
        5)
        clear
        show
        ;;
        6)
        break
        clear
        showlist
        ;;
        *)
        echo "Incorrect Choice"
        esac
    done
}
CaLc()
{
    echo -e "\e"
}
TaLk()
{
    echo -e "\e"
}
AbouT()
{
    echo -e "\n\e[31m ++++++++++++++++++++++++++++++++++++++\e[0m\n"
    echo -e "\n\e[32m This TooL IS CReAteD bY UnkNownVisiTor\e[0m\n";
    echo -e "\e[1;36m               ENJOY IT \e[0m"
    echo -e "\n\e[31m ++++++++++++++++++++++++++++++++++++++\e[0m\n"
}
USERS()
{
  select CHOICE in "aDD USER" "MoDiFY USER" "DEL USER" "aDD USER to A GROuP" "ChanGe The PassWoRD oF USER" "bacK"
  do
    case $REPLY in
        1)
            sudo adduser
        ;;
        2)
            echo "case 2 or 3"
        ;;
        3)
            read -p "plEase InserT the Name of The useR : " deluser
            echo -e "Are u sure ? (y/n) : \n" 
            read -p "------>" userdelans
                if [ userdelans == "y" ]; then
                     `sudo userdel deluser`
                else
                     echo  "salam sara"
                fi
                
        ;;
        4)  
            echo "InCoreCt CHOICE...."
        ;;
        5)
            echo "case 2 or 3"
        ;;
        6)
            read -p "PleasE inSerT The NAME oF UsEr : " user12
            `sudo passwd user12`
        ;;
        *)  
            echo "InCoreCt CHOICE...."
            break
            showlist
    esac
    
  done
}
PS3="=====>> " 
echo -e "\e[32m\n Hello Welcome \e[0m" 
sleep 1s
echo -e "\e[1;31m ToDay \e[0m"
sleep 1s
echo -e "\n \e[34m WE gonna SEE\e[0m"
sleep 1s
echo -e " \n \e[1m Some Of mY Skills in ShellScRipt\e[0m" 
read -p "  Are You REady DUde ? : " ans1
sleep 3
    if [ $ans1 == "yes" -o $ans1 == "y" ]; then
         echo ""
         echo -e " HeLLo Then \n"
         select CHOICE in "ProsseC ManageMEnt" "ALL AbouT THIS SiTUation" "LoGs VieWing" "MATRIX" "UpdaTe & UPgraDe" "USERS" "Date & CalEnDer" "PhoNeBOOK" "CaLc" "TaLk" "cLeaR" "ABouT" "EXiT" ;
        do
            case $REPLY in
                1)
                    ProcMNG
                    showlist
                ;;
                2)
                    AllAbout
                    showlist
                ;;
                3)
                    LoGs
                    showlist
                
                ;;
                4)
                    matrix
                    showlist
                ;;
                5)
                    Update
                    showlist
                ;;
                6)  
                    USERS
                    showlist
                ;;
                7)
                    echo -e "\n\e[33m`date`\e[0m\n" 
                    echo -e "\n\e[34m`cal`\e[0m\n"
                    showlist
                ;;
                8)
                    PhoNeBOOK
                    showlist
                ;;
                9)
                    CaLc
                   showlist
                ;;
                10) 
                    TaLk 
                    showlist
                ;;
                11)
                    clear
                   showlist
                ;;
                12) 
                    AbouT
                    showlist
                ;;
                13) 
                    break
                    exit
                ;;
            esac
            
        done
        exit 0
    fi 
    if [ $ans1 == "no" -o $ans1 == "n" ]; then
         echo " OK , ByE bYe "
    else
         echo " Don't Know What U Sayin' "
    fi
