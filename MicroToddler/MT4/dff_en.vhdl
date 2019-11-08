library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity dff_en IS
port(d,clk,en : IN std_logic; q : OUT std_logic);
End dff_en;

ARCHITECTURE BEHAVIORAL OF dff_en IS
BEGIN
Process
BEGIN
Wait UNTIL clk='1' AND clk'event;
IF(en='1') THEN
q<=d;
END IF;
END PROCESS;
END BEHAVIORAL;
