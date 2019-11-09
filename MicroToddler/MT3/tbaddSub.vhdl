-- File: tbalu.vhdl
-- Engineer: Matt Gambill
-- Date: 11/8/2019
-- Synopsis: File Defines a 16 bit add/subtractor with overflow detection
-- operation =0 is addition, operation=1 is subtraction
-- if the unit overflows the operation is invalid
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY tbaddSub IS
END ENTITY;

ARCHITECTURE one OF tbaddSub IS
	SIGNAL A, B, sum, ans, Aop              : std_logic_vector(15 DOWNTO 0);
	SIGNAL operation, overflow, check, Cout : std_logic := '0';
	SIGNAL Cvec                             : std_logic_vector(16 DOWNTO 0);
BEGIN
	dut : ENTITY work.addSub
		PORT MAP
			(operation => operation, A => A, B => B, Cvec => Cvec, sum => sum, Aop => Aop, overflow => overflow, Cout => Cout);

	simulation : PROCESS
	BEGIN
		operation <= '0';
		WAIT FOR 100 ns;
		A   <= "0000000000001010";
		B   <= "0000000000001011";
		ans <= "0000000000010101";
		IF (sum = ans) THEN
			check <= '1';
		ELSE
			check <= '0';
		END IF;

		WAIT FOR 100 ns;
		operation <= '0';
		A         <= "0000000000011011";
		B         <= "0000000000001011";
		ans       <= "0000000000100110";
		IF (sum = ans) THEN
			check <= '1';
		ELSE
			check <= '0';
		END IF;

		WAIT FOR 100 ns;
		operation <= '0';
		A         <= "1000000000001010";
		B         <= "1000000000001011";
		ans       <= "0000000000000001";
		IF (ans(0) = overflow) THEN
			check <= '1';
		ELSE
			check <= '0';
		END IF;

		-- Subtraction test

		WAIT FOR 100 ns;
		operation <= '1';
		A         <= "0000000000001010";
		B         <= "0000000000001111";
		ans       <= "0000000000000101";
		IF (sum = ans) THEN
			check <= '1';
		ELSE
			check <= '0';
		END IF;

		WAIT FOR 100 ns;
		operation <= '1';
		B         <= "0000000000011011";
		A         <= "0000000000001011";
		ans       <= "0000000000010000";
		IF (sum = ans) THEN
			check <= '1';
		ELSE
			check <= '0';
		END IF;

		WAIT FOR 100 ns;
		operation <= '1';
		B         <= "0000000000001011";
		A         <= "0000000000000000";
		ans       <= "0000000000000001";
		IF (ans(0) = overflow) THEN
			check <= '1';
		ELSE
			check <= '0';
		END IF;
		WAIT FOR 200 ns;
		WAIT;
	END PROCESS;
END ARCHITECTURE one;
