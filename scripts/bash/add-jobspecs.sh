
#!/bin/bash
source ./scripts/bash/common.sh
echo "Adding JobSpecs to Chainlink node..."
set -o allexport; source .env; set +o allexport

ETHUSD_AGGREGATOR=($(jq -r '.contracts | keys[0]' ./scripts/terrajs/addresses-bombay.json))
GOOGLUSD_AGGREGATOR=($(jq -r '.contracts | keys[1]' ./scripts/terrajs/addresses-bombay.json))
AMZNUSD_AGGREGATOR=($(jq -r '.contracts | keys[2]' ./scripts/terrajs/addresses-bombay.json))
BTCUSD_AGGREGATOR=($(jq -r '.contracts | keys[3]' ./scripts/terrajs/addresses-bombay.json))
LINKUSD_AGGREGATOR=($(jq -r '.contracts | keys[4]' ./scripts/terrajs/addresses-bombay.json))
AAPLUSD_AGGREGATOR=($(jq -r '.contracts | keys[5]' ./scripts/terrajs/addresses-bombay.json))
LUNAUSD_AGGREGATOR=($(jq -r '.contracts | keys[6]' ./scripts/terrajs/addresses-bombay.json))
FBUSD_AGGREGATOR=($(jq -r '.contracts | keys[7]' ./scripts/terrajs/addresses-bombay.json))

echo "LINKUSD_AGGREGATOR"
echo $LINKUSD_AGGREGATOR

echo "LUNAUSD_AGGREGATOR"
echo $LUNAUSD_AGGREGATOR

echo "BTCUSD_AGGREGATOR"
echo $BTCUSD_AGGREGATOR

echo "ETHUSD_AGGREGATOR"
echo $ETHUSD_AGGREGATOR

echo "AAPLUSD_AGGREGATOR"
echo $AAPLUSD_AGGREGATOR

echo "GOOGLUSD_AGGREGATOR"
echo $GOOGLUSD_AGGREGATOR

echo "FBUSD_AGGREGATOR"
echo $FBUSD_AGGREGATOR

echo "AMZNUSD_AGGREGATOR"
echo $AMZNUSD_AGGREGATOR
# TODO: Extreme duplication, handle it
function jobspec() {
echo $(
cat << EOF
{"toml":"
type            = \"webhook\"\n
schemaVersion   = 1\n
externalInitiators = [\n  
{ name = \"terra\", spec = \"{ \\\\\\"type\\\\\\": \\\\\\"external\\\\\\", \\\\\\"endpoint\\\\\\": \\\\\\"terra\\\\\\", 
\\\\\\"contract_address\\\\\\": \\\\\\"$BTCUSD_AGGREGATOR\\\\\\", 
\\\\\\"account_address\\\\\\": \\\\\\"$1\\\\\\", 
\\\\\\"fluxmonitor\\\\\\": { 
    \\\\\\"requestData\\\\\\": { \\\\\\"data\\\\\\": { \\\\\\"from\\\\\\": \\\\\\"BTC\\\\\\", \\\\\\"to\\\\\\": \\\\\\"USD\\\\\\" } }, 
    \\\\\\"feeds\\\\\\": [{ \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/nomics\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/cryptocompare\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/coingecko\\\\\\" }], 
    \\\\\\"threshold\\\\\\": 0.3, 
    \\\\\\"absoluteThreshold\\\\\\": 0, 
    \\\\\\"precision\\\\\\": 8, 
    \\\\\\"pollTimer\\\\\\": { \\\\\\"period\\\\\\": \\\\\\"30s\\\\\\" }, 
    \\\\\\"idleTimer\\\\\\": { \\\\\\"duration\\\\\\": \\\\\\"50s\\\\\\" } } } \" }\n]\n
observationSource   = \"\"\"\n    
parse_request  [type=jsonparse path=\"\" data=\"\$(jobRun.requestBody)\"]\n    
send_to_bridge [type=bridge timeout=0 name=\"$2\" 

requestData=<{ \"data\": \$(parse_request)}>]\n    
parse_request -> send_to_bridge\n\"\"\""}
EOF
)
}

function jobspec2() {
echo $(
cat << EOF
{"toml":"
type            = \"webhook\"\n
schemaVersion   = 1\n
externalInitiators = [\n  
{ name = \"terra\", spec = \"{ \\\\\\"type\\\\\\": \\\\\\"external\\\\\\", \\\\\\"endpoint\\\\\\": \\\\\\"terra\\\\\\", 
\\\\\\"contract_address\\\\\\": \\\\\\"$LUNAUSD_AGGREGATOR\\\\\\", 
\\\\\\"account_address\\\\\\": \\\\\\"$1\\\\\\", 
\\\\\\"fluxmonitor\\\\\\": { 
    \\\\\\"requestData\\\\\\": { \\\\\\"data\\\\\\": { \\\\\\"from\\\\\\": \\\\\\"LUNA\\\\\\", \\\\\\"to\\\\\\": \\\\\\"USD\\\\\\" } }, 
    \\\\\\"feeds\\\\\\": [{ \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/nomics\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/cryptocompare\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/coingecko\\\\\\" }], 
    \\\\\\"threshold\\\\\\": 0.3, 
    \\\\\\"absoluteThreshold\\\\\\": 0, 
    \\\\\\"precision\\\\\\": 8, 
    \\\\\\"pollTimer\\\\\\": { \\\\\\"period\\\\\\": \\\\\\"30s\\\\\\" }, 
    \\\\\\"idleTimer\\\\\\": { \\\\\\"duration\\\\\\": \\\\\\"50s\\\\\\" } } } \" }\n]\n
observationSource   = \"\"\"\n    
parse_request  [type=jsonparse path=\"\" data=\"\$(jobRun.requestBody)\"]\n    
send_to_bridge [type=bridge timeout=0 name=\"$2\" 

requestData=<{ \"data\": \$(parse_request)}>]\n    
parse_request -> send_to_bridge\n\"\"\""}
EOF
)
}


function jobspec3() {
echo $(
cat << EOF
{"toml":"
type            = \"webhook\"\n
schemaVersion   = 1\n
externalInitiators = [\n  
{ name = \"terra\", spec = \"{ \\\\\\"type\\\\\\": \\\\\\"external\\\\\\", \\\\\\"endpoint\\\\\\": \\\\\\"terra\\\\\\", 
\\\\\\"contract_address\\\\\\": \\\\\\"$LINKUSD_AGGREGATOR\\\\\\", 
\\\\\\"account_address\\\\\\": \\\\\\"$1\\\\\\", 
\\\\\\"fluxmonitor\\\\\\": { 
    \\\\\\"requestData\\\\\\": { \\\\\\"data\\\\\\": { \\\\\\"from\\\\\\": \\\\\\"LINK\\\\\\", \\\\\\"to\\\\\\": \\\\\\"USD\\\\\\" } }, 
    \\\\\\"feeds\\\\\\": [{ \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/nomics\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/cryptocompare\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/coingecko\\\\\\" }], 
    \\\\\\"threshold\\\\\\": 0.3, 
    \\\\\\"absoluteThreshold\\\\\\": 0, 
    \\\\\\"precision\\\\\\": 8, 
    \\\\\\"pollTimer\\\\\\": { \\\\\\"period\\\\\\": \\\\\\"30s\\\\\\" }, 
    \\\\\\"idleTimer\\\\\\": { \\\\\\"duration\\\\\\": \\\\\\"50s\\\\\\" } } } \" }\n]\n
observationSource   = \"\"\"\n    
parse_request  [type=jsonparse path=\"\" data=\"\$(jobRun.requestBody)\"]\n    
send_to_bridge [type=bridge timeout=0 name=\"$2\" 

requestData=<{ \"data\": \$(parse_request)}>]\n    
parse_request -> send_to_bridge\n\"\"\""}
EOF
)
}


function jobspec4() {
echo $(
cat << EOF
{"toml":"
type            = \"webhook\"\n
schemaVersion   = 1\n
externalInitiators = [\n  
{ name = \"terra\", spec = \"{ \\\\\\"type\\\\\\": \\\\\\"external\\\\\\", \\\\\\"endpoint\\\\\\": \\\\\\"terra\\\\\\", 
\\\\\\"contract_address\\\\\\": \\\\\\"$ETHUSD_AGGREGATOR\\\\\\", 
\\\\\\"account_address\\\\\\": \\\\\\"$1\\\\\\", 
\\\\\\"fluxmonitor\\\\\\": { 
    \\\\\\"requestData\\\\\\": { \\\\\\"data\\\\\\": { \\\\\\"from\\\\\\": \\\\\\"ETH\\\\\\", \\\\\\"to\\\\\\": \\\\\\"USD\\\\\\" } }, 
    \\\\\\"feeds\\\\\\": [{ \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/nomics\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/cryptocompare\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/coingecko\\\\\\" }], 
    \\\\\\"threshold\\\\\\": 0.3, 
    \\\\\\"absoluteThreshold\\\\\\": 0, 
    \\\\\\"precision\\\\\\": 8, 
    \\\\\\"pollTimer\\\\\\": { \\\\\\"period\\\\\\": \\\\\\"30s\\\\\\" }, 
    \\\\\\"idleTimer\\\\\\": { \\\\\\"duration\\\\\\": \\\\\\"50s\\\\\\" } } } \" }\n]\n
observationSource   = \"\"\"\n    
parse_request  [type=jsonparse path=\"\" data=\"\$(jobRun.requestBody)\"]\n    
send_to_bridge [type=bridge timeout=0 name=\"$2\" 

requestData=<{ \"data\": \$(parse_request)}>]\n    
parse_request -> send_to_bridge\n\"\"\""}
EOF
)
}


function jobspec5() {
echo $(
cat << EOF
{"toml":"
type            = \"webhook\"\n
schemaVersion   = 1\n
externalInitiators = [\n  
{ name = \"terra\", spec = \"{ \\\\\\"type\\\\\\": \\\\\\"external\\\\\\", \\\\\\"endpoint\\\\\\": \\\\\\"terra\\\\\\", 
\\\\\\"contract_address\\\\\\": \\\\\\"$GOOGLUSD_AGGREGATOR\\\\\\", 
\\\\\\"account_address\\\\\\": \\\\\\"$1\\\\\\", 
\\\\\\"fluxmonitor\\\\\\": { 
    \\\\\\"requestData\\\\\\": { \\\\\\"data\\\\\\": { \\\\\\"from\\\\\\": \\\\\\"GOOGL\\\\\\", \\\\\\"to\\\\\\": \\\\\\"USD\\\\\\" } }, 
    \\\\\\"feeds\\\\\\": [{ \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/tradermade\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/intrinio\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/iex-cloud-adapter\\\\\\" }], 
    \\\\\\"threshold\\\\\\": 0.3, 
    \\\\\\"absoluteThreshold\\\\\\": 0, 
    \\\\\\"precision\\\\\\": 8, 
    \\\\\\"pollTimer\\\\\\": { \\\\\\"period\\\\\\": \\\\\\"30s\\\\\\" }, 
    \\\\\\"idleTimer\\\\\\": { \\\\\\"duration\\\\\\": \\\\\\"50s\\\\\\" } } } \" }\n]\n
observationSource   = \"\"\"\n    
parse_request  [type=jsonparse path=\"\" data=\"\$(jobRun.requestBody)\"]\n    
send_to_bridge [type=bridge timeout=0 name=\"$2\" 

requestData=<{ \"data\": \$(parse_request)}>]\n    
parse_request -> send_to_bridge\n\"\"\""}
EOF
)
}

function jobspec6() {
echo $(
cat << EOF
{"toml":"
type            = \"webhook\"\n
schemaVersion   = 1\n
externalInitiators = [\n  
{ name = \"terra\", spec = \"{ \\\\\\"type\\\\\\": \\\\\\"external\\\\\\", \\\\\\"endpoint\\\\\\": \\\\\\"terra\\\\\\", 
\\\\\\"contract_address\\\\\\": \\\\\\"$AAPLUSD_AGGREGATOR\\\\\\", 
\\\\\\"account_address\\\\\\": \\\\\\"$1\\\\\\", 
\\\\\\"fluxmonitor\\\\\\": { 
    \\\\\\"requestData\\\\\\": { \\\\\\"data\\\\\\": { \\\\\\"from\\\\\\": \\\\\\"AAPL\\\\\\", \\\\\\"to\\\\\\": \\\\\\"USD\\\\\\" } }, 
    \\\\\\"feeds\\\\\\": [{ \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/tradermade\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/intrinio\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/iex-cloud-adapter\\\\\\" }], 
    \\\\\\"threshold\\\\\\": 0.3, 
    \\\\\\"absoluteThreshold\\\\\\": 0, 
    \\\\\\"precision\\\\\\": 8, 
    \\\\\\"pollTimer\\\\\\": { \\\\\\"period\\\\\\": \\\\\\"30s\\\\\\" }, 
    \\\\\\"idleTimer\\\\\\": { \\\\\\"duration\\\\\\": \\\\\\"50s\\\\\\" } } } \" }\n]\n
observationSource   = \"\"\"\n    
parse_request  [type=jsonparse path=\"\" data=\"\$(jobRun.requestBody)\"]\n    
send_to_bridge [type=bridge timeout=0 name=\"$2\" 

requestData=<{ \"data\": \$(parse_request)}>]\n    
parse_request -> send_to_bridge\n\"\"\""}
EOF
)
}


function jobspec7() {
echo $(
cat << EOF
{"toml":"
type            = \"webhook\"\n
schemaVersion   = 1\n
externalInitiators = [\n  
{ name = \"terra\", spec = \"{ \\\\\\"type\\\\\\": \\\\\\"external\\\\\\", \\\\\\"endpoint\\\\\\": \\\\\\"terra\\\\\\", 
\\\\\\"contract_address\\\\\\": \\\\\\"$FBUSD_AGGREGATOR\\\\\\", 
\\\\\\"account_address\\\\\\": \\\\\\"$1\\\\\\", 
\\\\\\"fluxmonitor\\\\\\": { 
    \\\\\\"requestData\\\\\\": { \\\\\\"data\\\\\\": { \\\\\\"from\\\\\\": \\\\\\"FB\\\\\\", \\\\\\"to\\\\\\": \\\\\\"USD\\\\\\" } }, 
    \\\\\\"feeds\\\\\\": [{ \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/tradermade\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/intrinio\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/iex-cloud-adapter\\\\\\" }], 
    \\\\\\"threshold\\\\\\": 0.3, 
    \\\\\\"absoluteThreshold\\\\\\": 0, 
    \\\\\\"precision\\\\\\": 8, 
    \\\\\\"pollTimer\\\\\\": { \\\\\\"period\\\\\\": \\\\\\"30s\\\\\\" }, 
    \\\\\\"idleTimer\\\\\\": { \\\\\\"duration\\\\\\": \\\\\\"50s\\\\\\" } } } \" }\n]\n
observationSource   = \"\"\"\n    
parse_request  [type=jsonparse path=\"\" data=\"\$(jobRun.requestBody)\"]\n    
send_to_bridge [type=bridge timeout=0 name=\"$2\" 

requestData=<{ \"data\": \$(parse_request)}>]\n    
parse_request -> send_to_bridge\n\"\"\""}
EOF
)
}

function jobspec8() {
echo $(
cat << EOF
{"toml":"
type            = \"webhook\"\n
schemaVersion   = 1\n
externalInitiators = [\n  
{ name = \"terra\", spec = \"{ \\\\\\"type\\\\\\": \\\\\\"external\\\\\\", \\\\\\"endpoint\\\\\\": \\\\\\"terra\\\\\\", 
\\\\\\"contract_address\\\\\\": \\\\\\"$AMZNUSD_AGGREGATOR\\\\\\", 
\\\\\\"account_address\\\\\\": \\\\\\"$1\\\\\\", 
\\\\\\"fluxmonitor\\\\\\": { 
    \\\\\\"requestData\\\\\\": { \\\\\\"data\\\\\\": { \\\\\\"from\\\\\\": \\\\\\"AMZN\\\\\\", \\\\\\"to\\\\\\": \\\\\\"USD\\\\\\" } }, 
    \\\\\\"feeds\\\\\\": [{ \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/tradermade\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/intrinio\\\\\\" }, { \\\\\\"url\\\\\\": \\\\\\"https://adapters.main.stage.cldev.sh/iex-cloud-adapter\\\\\\" }], 
    \\\\\\"threshold\\\\\\": 0.3, 
    \\\\\\"absoluteThreshold\\\\\\": 0, 
    \\\\\\"precision\\\\\\": 8, 
    \\\\\\"pollTimer\\\\\\": { \\\\\\"period\\\\\\": \\\\\\"30s\\\\\\" }, 
    \\\\\\"idleTimer\\\\\\": { \\\\\\"duration\\\\\\": \\\\\\"50s\\\\\\" } } } \" }\n]\n
observationSource   = \"\"\"\n    
parse_request  [type=jsonparse path=\"\" data=\"\$(jobRun.requestBody)\"]\n    
send_to_bridge [type=bridge timeout=0 name=\"$2\" 

requestData=<{ \"data\": \$(parse_request)}>]\n    
parse_request -> send_to_bridge\n\"\"\""}
EOF
)
}
CL_URL='https://ter-t-0.staging.org.devnet.tools'
login_cl "$CL_URL" $CL_NODE_1_PASSWORD
ORACLE_ADDRESS="terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6"
BRIDGE_NAME="write-adapter"

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec2 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec3 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec4 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec5 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec6 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec7 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec8 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

CL_URL='https://ter-t-1.staging.org.devnet.tools'
login_cl "$CL_URL" $CL_NODE_2_PASSWORD 
ORACLE_ADDRESS="terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s"
BRIDGE_NAME="write-adapter"

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec2 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec3 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec4 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec5 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec6 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec7 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec8 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

CL_URL='https://ter-t-2.staging.org.devnet.tools'
login_cl "$CL_URL" $CL_NODE_3_PASSWORD 
ORACLE_ADDRESS="terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5"
BRIDGE_NAME="write-adapter"

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec2 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec3 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec4 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec5 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec6 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec7 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

JOBID=$(curl -s -b ./cookiefile -d "$(jobspec8 $ORACLE_ADDRESS $BRIDGE_NAME)" -X POST -H 'Content-Type: application/json' "$CL_URL/v2/jobs")
echo $JOBID

echo "Jobspecs has been added to Chainlink nodes"

