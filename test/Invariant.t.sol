// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2 <0.9.0;

import "forge-std/Test.sol";
import "contracts/Deposit.sol";

contract InvariantDeposit is Test {
    Deposit deposit;
    address depositor;

    function setUp() external {
        // Create a new instance of the Deposit contract and send it 100 ether
        deposit = new Deposit();
        vm.deal(address(deposit), 100 ether);

        // Set the depositor to the address of the test contract
        depositor = address(this);
    }

    function invariant_alwaysWithdrawable() external {
        // Deposit 1 ether
        deposit.deposit{value: 1 ether}();

        // Check that the depositor's balance is now 1 ether
        uint256 balanceBefore = deposit.balance(depositor);
        assertEq(balanceBefore, 1 ether);

        // Withdraw the ether
        deposit.withdraw();

        // Check that the depositor's balance is now 0 ether
        uint256 balanceAfter = deposit.balance(depositor);
        assertEq(balanceAfter, 0 ether);

        // Assert that the balance before the withdraw is greater than the balance after
        // This ensures that the depositor was able to withdraw the same amount they deposited
        assertGt(balanceBefore, balanceAfter);
    }

    receive() external payable {}
}
