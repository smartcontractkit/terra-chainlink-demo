#!/usr/bin/env bash

set -e

echo "*** Setup feeds ***"

cd $(dirname ${BASH_SOURCE[0]})/../..
NETWORK=$1
# NETWORK=${NETWORK:="localterra"}

echo "Uploading Chainlink contracts"
# non-gauntlet way of initializing feeds
# (cd ./scripts/terrajs && yarn start)
# fix duplication below?
# the binary is created by running `yarn bundle` https://github.com/smartcontractkit/gauntlet-terra. on `bin` folder
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ./gauntlet-terra-linux deploy --network=$NETWORK --rdd=./scripts/terrajs/addresses-bombay.json
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=LINK/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=LUNA/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=BTC/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=ETH/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=AAPL/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=GOOGL/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=FB/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=AMZN/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
elif [[ "$OSTYPE" == "darwin"* ]]; then
    ./gauntlet-terra-linux deploy --network=$NETWORK --rdd=./scripts/terrajs/addresses-bombay.json
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=LINK/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=LUNA/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=BTC/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=ETH/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=AAPL/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=GOOGL/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=FB/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
    ./gauntlet-terra-linux setupFeed --network=$NETWORK --paymentAmount=1 --minSubmissionValue=0 --maxSubmissionValue=99999999999999999999999999999 --minSubmissionCount=1 --timeout=60 --decimals=8 --description=AMZN/USD --rdd=./scripts/terrajs/addresses-bombay.json terra1gq88kks6um33nkzt3fpftvyxf8u9s2peadn5m6 terra13xggepy23l2pdsxf2zxx866cww5cc5uhn8lr8s terra164krvahqeczt058v7d86qrpwwa2mg2d6ch0vw5
else
    echo "OS not supported"
fi
