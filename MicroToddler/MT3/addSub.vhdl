-- File: alu.vhdl
-- Engineer: Matt Gambill
-- Date: 11/8/2019
-- Synopsis: File Defines a 16 bit add/subtractor with overflow detection
-- operation =0 is addition, operation=1 is subtraction
-- if the unit overflows the operation is invalid
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY addSub IS
	PORT
	(
		operation : IN std_logic;
		A, B      : IN std_logic_vector(15 DOWNTO 0);
    
		sum  : OUT std_logic_vector(15 DOWNTO 0);
		overflow,Cout  : OUT std_logic);
END addSub;

ARCHITECTURE rtl OF addSub IS
SIGNAL Cvec : std_logic_vector(16 DOWNTO 0);
SIGNAL Aop  : std_logic_vector(15 DOWNTO 0);
BEGIN
	Cvec(0)           <= operation;                         -- operation could also be named Cin
	Aop               <= NOT A WHEN operation = '1' ELSE A; -- Take 2's Complement if subtraction operation is asserted

	sum               <= Aop XOR B XOR Cvec(15 DOWNTO 0);
	Cvec(16 DOWNTO 1) <= (Aop AND B) OR (Aop AND Cvec(15 DOWNTO 0)) OR (B AND Cvec(15 DOWNTO 0));

	overflow          <= Cvec(16) XOR Cvec(15);
  Cout              <= Cvec(16);
END rtl;
