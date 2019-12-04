LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY busdr IS
   PORT (dr : IN std_logic;
         datain : IN std_logic_vector(15 downto 0);
         dataout : OUT std_logic_vector(15 downto 0));
END busdr;

ARCHITECTURE one OF busdr IS
BEGIN
  dataout <= datain WHEN dr='1' ELSE "ZZZZZZZZZZZZZZZZ";
END one;

