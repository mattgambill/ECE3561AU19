LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY tbusdr IS
END tbusdr;

ARCHITECTURE one OF tbusdr IS
COMPONENT busdr IS
   PORT (dr : IN std_logic;
         datain : IN std_logic_vector(15 downto 0);
         dataout : OUT std_logic_vector(15 downto 0));
END COMPONENT;
FOR all: busdr USE ENTITY work.busdr(one);

SIGNAL dr : std_logic;
SIGNAL datain,dataout : std_logic_vector(15 downto 0);

BEGIN
  U0:  busdr PORT MAP (dr,datain,dataout);

  PROCESS
  BEGIN
     dr <= '0';
     datain <= "0000111100001111";
     WAIT FOR 10 ns;
     dr <= '1';
     datain <= "0000111100001111";
     WAIT FOR 10 ns;
     dr <= '0';
     datain <= "1111000011110000";
     WAIT FOR 10 ns;
     dr <= '1';
     datain <= "1111000011110000";
     WAIT FOR 10 ns;
     dr <= '0';
     datain <= "1111000011110000";
     WAIT FOR 10 ns;
     WAIT;
  END PROCESS;

END one;