#/bin/bash
#Desencripto por primera vez
./flip.sh z v $1
./flip.sh y h elif.txt >> elif.txt
./flip.sh x p elif.txt >> elif.txt
./flip.sh w u elif.txt >> elif.txt
./flip.sh v z elif.txt >> elif.txt
./flip.sh u s elif.txt >> elif.txt
./flip.sh t f elif.txt >> elif.txt
./flip.sh s g elif.txt >> elif.txt
./flip.sh r x elif.txt >> elif.txt
./flip.sh q e elif.txt >> elif.txt
./flip.sh p d elif.txt >> elif.txt
./flip.sh o r elif.txt >> elif.txt
./flip.sh n m elif.txt >> elif.txt
./flip.sh m b elif.txt >> elif.txt
./flip.sh l j elif.txt >> elif.txt
./flip.sh k a elif.txt >> elif.txt
./flip.sh j c elif.txt >> elif.txt
./flip.sh i y elif.txt >> elif.txt
./flip.sh h k elif.txt >> elif.txt
./flip.sh g t elif.txt >> elif.txt
./flip.sh f q elif.txt >> elif.txt
./flip.sh e o elif.txt >> elif.txt
./flip.sh d l elif.txt >> elif.txt
./flip.sh c w elif.txt >> elif.txt
./flip.sh b n elif.txt >> elif.txt
./flip.sh a i elif.txt >> elif.txt
#Desencripto 9 veces mas y listo
for i in {1..9}
do
./flip.sh z v elif.txt >> elif.txt
./flip.sh y h elif.txt >> elif.txt
./flip.sh x p elif.txt >> elif.txt
./flip.sh w u elif.txt >> elif.txt
./flip.sh v z elif.txt >> elif.txt
./flip.sh u s elif.txt >> elif.txt
./flip.sh t f elif.txt >> elif.txt
./flip.sh s g elif.txt >> elif.txt
./flip.sh r x elif.txt >> elif.txt
./flip.sh q e elif.txt >> elif.txt
./flip.sh p d elif.txt >> elif.txt
./flip.sh o r elif.txt >> elif.txt
./flip.sh n m elif.txt >> elif.txt
./flip.sh m b elif.txt >> elif.txt
./flip.sh l j elif.txt >> elif.txt
./flip.sh k a elif.txt >> elif.txt
./flip.sh j c elif.txt >> elif.txt
./flip.sh i y elif.txt >> elif.txt
./flip.sh h k elif.txt >> elif.txt
./flip.sh g t elif.txt >> elif.txt
./flip.sh f q elif.txt >> elif.txt
./flip.sh e o elif.txt >> elif.txt
./flip.sh d l elif.txt >> elif.txt
./flip.sh c w elif.txt >> elif.txt
./flip.sh b n elif.txt >> elif.txt
./flip.sh a i elif.txt >> elif.txt
done
cat elif.txt
