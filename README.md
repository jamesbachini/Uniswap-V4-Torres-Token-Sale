# Uniswap v4 Token Sale

This repo is an unfinished/untested experiment to create a compliant token sale contract following the regulatory guidance coming out of the XRP case.

Concept: https://jamesbachini.com/xrp-legal-case/

The idea is to have an ERC20 token which get's distributed to stakeholders in the project. A percentage of their holdings gets deposited to a Uniswap v4 liquidity pool. The pool includes a hook which allows VC's and crypto funds to buy tokens for a period of time with a minimum sale amount. Once the private round is over the hook is bypassed to enable public trading.

Test in foundry (recommend using WSL or a unix based OS)
```
curl -L https://foundry.paradigm.xyz | bash
source /home/james/.bashrc
foundryup
forge install https://github.com/Uniswap/v4-core --no-commit
forge install https://github.com/Uniswap/v4-periphery --no-commit
forge install openzeppelin/openzeppelin-contracts --no-commit
forge install marktoda/forge-gas-snapshot --no-commit
forge test
```

More info on Uniswap v4 hooks at https://jamesbachini.com/uniswap-v4-hooks/

Note that this code is a work in progress and shouldn't be forked or used in a production environment
