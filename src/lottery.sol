//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Lottery{
    // o array dinamico de players que vão ingressar no jogo
    // address payable indica que sao enderecos que podem
    // enviar e receber eth
    address payable[] public players;

    // sera o responsavel por 
    // controlar a loteria
    // e pagar o vencedor
    address public manager;

    // armazena em manager
    // o criador do contrato
    constructor(){
        manager = msg.sender;
    }

    // funcao que possibilita contas/
    // contratos externos enviem eth
    // para o contrato
    receive() external payable { 
        // o valor para as apostas deve
        // ser 0.1 eth
        require(msg.value == 0.1 ether);

        // convertido para payable
        // para ser compativel com
        // o tipo do array de payable
        // players
        players.push(payable(msg.sender));
    }

    // define a funcao para verificar o 
    // saldo do contrato. isso so pode
    // ser feito pelo manager
    function getBalance() public view returns(uint){
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }
}