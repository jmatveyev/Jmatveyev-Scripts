# Run from server where ADConnect is installed
import-module ADSync
# Will run Full imports and Synchronizations from and to Azure 
Start-ADSyncSyncCycle -PolicyType Initial

# Will run Delta imports and syncronizations from and to Azure
Start-ADSyncSyncCycle -PolicyType Delta