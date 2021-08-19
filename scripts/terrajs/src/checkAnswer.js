
import { readFileSync } from "fs";

import {
  LCDClient
} from "@terra-money/terra.js";

const terra = new LCDClient({
  URL: "https://bombay-lcd.terra.dev",
  chainID: "bombay-9",
  gasPrices: { uluna: 0.015 },
});

run();

async function run() {
  const addressesLINKUSD = JSON.parse(readFileSync('addresses-LINKUSD.json', { encoding: 'utf8' }));
  const resultLINKUSD = await terra.wasm.contractQuery(addressesLINKUSD['FLUX_AGGREGATOR'], { get_latest_round_data: {} });
  console.log("LINK / USD answer:");
  console.log(resultLINKUSD);

  const addressesLUNAUSD = JSON.parse(readFileSync('addresses-LUNAUSD.json', { encoding: 'utf8' }));
  const resultLUNAUSD = await terra.wasm.contractQuery(addressesLUNAUSD['FLUX_AGGREGATOR'], { get_latest_round_data: {} });
  console.log("LUNA / USD answer:");
  console.log(resultLUNAUSD);
}

