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
}