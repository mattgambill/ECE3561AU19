LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY treg IS
END treg;
 
ARCHITECTURE one OF treg IS
  --declare component
  COMPONENT reg16 IS
     PORT (din  : IN  std_logic_vector(15 downto 0);
           dout : OUT std_logic_vector(15 downto 0);
           load : IN std_logic);
  END COMPONENT;
  FOR all : reg16 USE ENTITY WORK.reg16(one);
  --declare local sigs
  SIGNAL din,dout : std_logic_vector(15 downto 0);
  SIGNAL load : std_logic;


BEGIN
  u0 : reg16 PORT MAP (din,dout,load);

  
  PROCESS
  BEGIN
    din <= "0000111100001111";
    load <= '0';
    WAIT FOR 10 ns;
    load <= '1';
    WAIT FOR 1 ns;
    load <= '0';
    WAIT FOR 9 ns;
    din <= "1111000011110000";
    load <= '1';
    WAIT FOR 1 ns; 
    load <= '0';
    WAIT FOR 9 ns;
    din <= "0000111100001111";
    load <= '1';
    WAIT FOR 1 ns; 
    load <= '0';
    WAIT FOR 9 ns;
    WAIT;
  END PROCESS;


END one;