echo "Write a Bash script that monitors CPU and memory usage every 5 seconds and logs the data into a file."

LOG_FILE="system_monitor.log"

echo "Timestamp                | CPU Usage (%) | Memory Usage (%)" > $LOG_FILE
echo "-------------------------------------------------------------" >> $LOG_FILE

while true
do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')  
    MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')     

    LOG_ENTRY="$TIMESTAMP |     ${CPU_USAGE}%     |     ${MEM_USAGE}%"
    echo "$LOG_ENTRY" >> $LOG_FILE

    echo "$LOG_ENTRY"

    sleep 5
done
