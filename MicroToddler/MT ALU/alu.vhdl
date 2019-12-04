LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY alu IS
  PORT (a,b : IN std_logic_vector (15 downto 0);
        cin,arlo : IN std_logic;
	ltt : std_logic_vector(0 to 3);
        res : OUT std_logic_vector (15 downto 0);
        cout : OUT std_logic);
END alu;

ARCHITECTURE one OF alu IS
  
	COMPONENT mux2_to_1x16 IS
   PORT (a,b : IN std_logic_vector(15 downto 0);
         sa,sb : IN std_logic;
         muxout : OUT std_logic_vector(15 downto 0));
END COMPONENT;

COMPONENT log16 IS
  PORT(a,b : IN std_logic_vector(15 downto 0);
       res : OUT std_logic_vector(15 downto 0);
       ltt : IN std_logic_vector(0 to 3));
END COMPONENT;

COMPONENT add16 IS
  PORT (a,b : IN std_logic_vector (15 downto 0);
        cin : IN std_logic;
        sum : OUT std_logic_vector (15 downto 0);
        cout : OUT std_logic);
END COMPONENT;
	

SIGNAL lu_result,addr_result : std_logic_vector (15 downto 0);
SIGNAL notArlo : std_logic;
BEGIN

logicUnit0 : log16 PORT MAP(a,b,lu_result,ltt);
addr0 : add16 PORT MAP(a,b,cin,addr_result,cout);
mux0 : mux2_to_1x16 PORT MAP(addr_result,lu_result,arlo,notArlo,res);

notArlo <= not(arlo);
END one;