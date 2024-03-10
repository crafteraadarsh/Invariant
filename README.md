

# Getting Started

Click [`use this template`](https://github.com/crafteraadarsh/Foundry_Template) to start.

Run: `curl -L https://foundry.paradigm.xyz | bash && source ~/.bashrc && foundryup`

Build the foundry project with `forge build`. Run tests with `forge test`. Measure gas with `forge snapshot`. Format with `forge fmt`.

## GitHub Actions

Contracts will be tested and gas measured on every push and pull request.

You can edit the CI script in [.github/workflows/ci.yml](./.github/workflows/ci.yml).

## Blueprint

```txt
lib
├─ forge-std — https://github.com/foundry-rs/forge-std
scripts
├─ Deploy.s.sol — Test Deployment
src
├─ Tester — Tester Contract
test
└─ Tester.t - Test Contract
```
## Disclaimer

*These smart contracts and testing suite are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of anything provided herein or through related user interfaces. This repository and related code have not been audited and as such there can be no assurance anything will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk.*

## License

See [LICENSE](./LICENSE) for more details.
## What's Happening Here?

This contract is an invariant test for the `Deposit` contract, which allows anyone to deposit and withdraw ether. The invariant being tested is that any amount deposited should be withdraw-able by the same person and the same amount.

The `setUp` function creates a new instance of the `Deposit` contract and sends it 100 ether. It also sets the `depositor` to the address of the test contract.

The `invariant_alwaysWithdrawable` function tests that the depositor can withdraw the ether they deposited and that the same amount is withdrawn as was deposited. It does this by depositing 1 ether, checking the depositor's balance before and after the withdraw, and asserting that the balance before the withdraw is greater than the balance after.

The `receive` function is used to handle incoming ether during the test.

The `vm.deal` function is used to send ether to the `Deposit` contract during the setUp function. The `assertEq` function is used to check that two values are equal, and the `assertGt` function is used to check that one value is greater than another value.

## How is this Different from Fuzzing?

This is an invariant test because it checks that a certain property of the `Deposit` contract always holds, specifically that any amount deposited should be withdraw-able by the same person and the same amount. 

It is not a `fuzz` test because it does not test the contract's behavior under different inputs or conditions, but rather checks that a specific property of the contract always holds.
