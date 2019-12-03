LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY tregln IS
END tregln;
 
ARCHITECTURE one OF tregln IS
  COMPONENT regLine IS
     PORT (ABUS,BBUS : INOUT std_logic_vector (15 downto 0);
           Aload,Bload,Adrive,Bdrive,Arsel,Brsel : IN std_logic);
  END COMPONENT;
  FOR all: regLine USE ENTITY work.regLine(one);

  SIGNAL ABUS,BBUS : std_logic_vector(15 downto 0);
  SIGNAL Aload,Bload,Adrive,Bdrive,Arsel,Brsel : std_logic;



BEGIN
  U0 : regLine PORT MAP (ABUS,BBUS,Aload,Bload,Adrive,Bdrive,Arsel,Brsel);

  PROCESS
  BEGIN
    ABUS <= "ZZZZZZZZZZZZZZZZ";  BBUS <= "ZZZZZZZZZZZZZZZZ";
    Adrive <= '0'; Bdrive <= '0'; Aload <= '0'; Bload <= '0'; Arsel <= '0'; Brsel <= '0';
    WAIT FOR 10 ns;
    ABUS <= "0000111100001111"; 
    WAIT FOR 1 ns;
    Adrive <= '0'; Bdrive <= '0'; Aload <= '1'; Bload <= '0'; Arsel <= '1'; Brsel <= '0';
    WAIT FOR 9 ns;
    Adrive <= '0'; Bdrive <= '0'; Aload <= '0'; Bload <= '0'; Arsel <= '0'; Brsel <= '0';
    ABUS <= "ZZZZZZZZZZZZZZZZ";
    WAIT FOR 10 ns;
    Adrive <= '1'; Bdrive <= '0'; Aload <= '0'; Bload <= '0'; Arsel <= '1'; Brsel <= '0';
    WAIT FOR 10 ns;
    Adrive <= '0'; Bdrive <= '0'; Aload <= '0'; Bload <= '0'; Arsel <= '0'; Brsel <= '0';
    WAIT FOR 10 ns;
    Adrive <= '0'; Bdrive <= '1'; Aload <= '0'; Bload <= '0'; Arsel <= '0'; Brsel <= '1';
    WAIT FOR 10 ns;
    Adrive <= '0'; Bdrive <= '0'; Aload <= '0'; Bload <= '0'; Arsel <= '0'; Brsel <= '0';
    WAIT FOR 10 ns;
    BBUS <= "1111000011110000"; Brsel <= '1';
    WAIT FOR 1 ns;
    Adrive <= '0'; Bdrive <= '0'; Aload <= '0'; Bload <= '1'; Arsel <= '0'; Brsel <= '1';
    WAIT FOR 9 ns;
    Adrive <= '0'; Bdrive <= '0'; Aload <= '0'; Bload <= '0'; Arsel <= '0'; Brsel <= '0';
    BBUS <= "ZZZZZZZZZZZZZZZZ";
    WAIT FOR 10 ns;
    Adrive <= '0'; Bdrive <= '1'; Aload <= '0'; Bload <= '0'; Arsel <= '0'; Brsel <= '1';
    WAIT FOR 10 ns;
    Adrive <= '0'; Bdrive <= '0'; Aload <= '0'; Bload <= '0'; Arsel <= '0'; Brsel <= '0';
    WAIT FOR 10 ns;
    Adrive <= '1'; Bdrive <= '0'; Aload <= '0'; Bload <= '0'; Arsel <= '1'; Brsel <= '1';
    WAIT FOR 10 ns;
    Adrive <= '0'; Bdrive <= '0'; Aload <= '0'; Bload <= '0'; Arsel <= '0'; Brsel <= '0';






    WAIT;
  END PROCESS;

END one;