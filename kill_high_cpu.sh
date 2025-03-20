echo "Q. Write a Bash script that finds and kills all processes consuming more than 80% CPU usage."

THRESHOLD=80

HIGH_CPU_PROCESSES=$(ps -eo pid,%cpu,cmd --sort=-%cpu | awk -v threshold=$THRESHOLD '$2 > threshold {print $1, $2, $3}')

if [ -z "$HIGH_CPU_PROCESSES" ]; then
    echo "No processes found consuming more than $THRESHOLD% CPU."
    exit 0
fi

echo "Processes consuming more than $THRESHOLD% CPU:"
echo "$HIGH_CPU_PROCESSES"


read -p "Do you want to kill these processes? (y/n): " CONFIRM

if [ "$CONFIRM" == "y" ]; then

    echo "$HIGH_CPU_PROCESSES" | awk '{print $1}' | xargs kill -9
    echo "High CPU usage processes killed successfully."
else
    echo "No processes were killed."
fi
