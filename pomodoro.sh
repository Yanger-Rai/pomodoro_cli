
echo "=======WELCOME TO POMODORO CLI======="
echo "====================================="

echo "Enter the duration in minutes you wish to stay focus?"
read FOCUS

echo "Enter the duration you wish to unfocus?"
read UNFOCUS

echo "You choose to focus for $FOCUS minute and unfocus for $UNFOCUS minute"

echo "=========TIMER STARTED============"

focus_seconds=$((FOCUS * 60))
unfocus_seconds=$((UNFOCUS * 60))
start=$(date +%s)
is_focus_time=true

while true; do
	 current_time=$(($(date +%s) - start))
	 remaining_time=$((is_focus_time ? focus_seconds - current_time : unfocus_seconds - current_time))


	 if [[ $remaining_time -le 0 ]]; then
		 if $is_focus_time; then
			 echo -e "\n"
			 echo -e "\n
			 ########################################\n
			        Time to take a break, senpai!    \n
			 ########################################"
			 afplay /System/Library/Sounds/Ping.aiff
			 is_focus_time=false
			 start=$(date +%s)
		 else
			 echo -e "\nBreak's over! Time to focus again, senpai!"
			 afplay /System/Library/Sounds/Ping.aiff
			 is_focus_time=true
			 start=$(date +%s)
		 fi
	 fi

	 printf '\r%s' "$(date -u -r $current_time +%H:%M:%S)"
	 sleep 1
 done
	
