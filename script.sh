#To create the first file
creatfirstfile(){
  touch "$1"
  chmod "$2" "$1"
  docker ps -a  | tee "$1"
  echo "Created first file with docker processes"
}

#If the first file is existing creating the second file
createsecondfile(){
  touch "$1"
  chmod "$2" "$1"
  docker ps -a | tee "$1"
  echo "First file is existing so creating second file with new docker processes"

}

#To check the diffrences between two files and say what is it.
checkdiff(){
 clear
 echo "Diffrences are:"
 diff "$1" "$2"
}

#Function for logic
checkfile(){
  #making the name as first file
  FILE=file1.txt
  if [ -f $FILE ]; then
    createsecondfile file2.txt 777
    checkdiff file1.txt file2.txt
  else
    creatfirstfile file1.txt 777
  fi
}

checkfile
