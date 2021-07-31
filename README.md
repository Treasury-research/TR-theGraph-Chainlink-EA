# TR subgraph2CL EA
This is a Chainlink external adapter built by Treasury research for the purpose of querying & computing & feeding DeFi's treasury matrices to multiple blockchains.

## Major functions

This external adapter will be deployed on Chainlink's Decentralized Oracle Network (DON) which served hundreds of data feeds and DeFis projects in worldwide. To use Chainlink DON to query and consolidate (calculate) on-chain data from theGraph in a trustless manner, this EA allows oracle nodes to query & compute seperately, and consolidate final outputs with OCR (off-chain report) technology.

Also, with this EA, final outputs will be feeded to Ethereum L1, Polygon and other layer2s, therefore, it allows DeFis on any blockchain to use these final outputs securely and trustlessly.



### Code  Struct

```
+-- contracts
    +-- keeper
    |   +-- theGraphEAKeeper.sol
    +-- oracle
    |   +-- oracle.sol
    +-- mcdex-mai
    |   +-- mcdex.sol
    priceConsumerV3.sol
    theGraphDataEA.sol
```

#### **oracle.sol** 
chainlink oracle contracts

#### **mcdex.sol** 
mcdex contracts ,this contains **approve**、**deposit**、**tradeBuy**、**tradeSell**

#### **priceConsumerV3.sol**
get Arbitrum UNI-USD price.sol

#### **theGraphDataEA.sol**
chianlink External Adapters.

#### **theGraphEAKeeper.sol**
chianlink keeper. this auto call theGraphDataEA.

### Credit
This EA was built upon a Chainlink EA template which created by @Patrick Collions
https://blog.chain.link/build-and-use-external-adapters/