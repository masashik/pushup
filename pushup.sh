#!/bin/sh
 
#Setup a volume of the music.
volume=3
 
#Generate a random number.
randomNum=`echo $RANDOM`;
 
#Use this range to raise the strength of push-up.
range=5;
pushupDue=10;
 
#Generate range number between 0 to 5
pushupMin=`expr $randomNum % $range`;

#Generate range number between 0 to 15
pushupNum=`expr $pushupDue + $pushupMin`;
 
#Ocassinally you need someone’s cheer.
cheer=`expr $randomNum % $pushupNum`;
 
#Wake your Mac up.
osascript -e "set volume ${volume}";

# Op1 - Find if the pushupNum is even or odd.
rem=$(($pushupNum % 2))
# Op2 - Find if the pushupNum is even or odd.
#if [ $((number%2)) -eq 0 ] 

# Switch pushups or situps based on the number of exercise count.
if [ $rem -eq 0 ]
then
	osascript -e "set volume ${volume}"
  say -v Victoria "Everyone be ready to do ${pushupNum} pushups" &
  #say -v kyoko "腕立てを${pushupNum}回お願いします。" &
else
	osascript -e "set volume ${volume}"
  say -v Victoria "Everyone be ready to do ${pushupNum} situps" &
  #say -v kyoko "腹筋を${pushupNum}回お願いします。" &
fi

# Wait a second to tone down the volume to play exercise music. 
sleep 3;

osascript -e "set volume ${volume}"
# Music: https://www.bensound.com
afplay './bensound-energy.mp3' &

# Wait a second to tone down the volume to play exercise music. 
sleep 5;
 
#This is the part to count and tell you the number of push-ups.
counter=1;
#sleep 10;
while [ $counter -le $pushupNum ]
do
if [ $counter -eq $cheer ]
then
say -v Victoria "Let’s Go.";
#say -v kyoko "頑張ってください。";
fi
say -v Victoria $counter;
#say -v kyoko $counter;
sleep 0.8;
let counter=counter+1;
done
 
#Once done, stop music.
killall afplay;
sleep 3;
 
#Victoria will give you a rewarding message for your achievement.
say -v Victoria "Good Job Everyone!";
#say -v kyoko "お疲れ様でした。";
 
#Let your Mac silent again since you will be back to work now.
osascript -e "set volume 0";
