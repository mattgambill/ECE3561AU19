LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY regSet IS
	PORT (
		ABUS, BBUS                    : INOUT std_logic_vector(15 DOWNTO 0);
		Aload, Bload, Adrive, Bdrive  : IN std_logic;
		Aregno,Bregno		      : IN std_logic_vector(2 downto 0)
	);
END regSet;

ARCHITECTURE one OF regSet IS

	-- define subcomponents
	COMPONENT regLine IS
	PORT (
		ABUS, BBUS                                  : INOUT std_logic_vector(15 DOWNTO 0);
		Aload, Bload, Adrive, Bdrive, Arsel, Brsel  : IN std_logic
	);
	END COMPONENT;
	COMPONENT pri3to8 IS
  		PORT (pri : IN std_logic_vector(2 downto 0);
        	p0,p1,p2,p3,p4,p5,p6,p7 : OUT std_logic);
	END COMPONENT;



	SIGNAL Arsel0,Arsel1,Arsel2,Arsel3,Arsel4,Arsel5,Arsel6,Arsel7 : std_logic;
	SIGNAL Brsel0,Brsel1,Brsel2,Brsel3,Brsel4,Brsel5,Brsel6,Brsel7 : std_logic;


	BEGIN
	regLine0 : regLine PORT MAP(ABUS,BBUS,Aload,Bload,Adrive,Bdrive,Arsel0, Brsel0);
	regLine1 : regLine PORT MAP(ABUS,BBUS,Aload,Bload,Adrive,Bdrive,Arsel1, Brsel1);
	regLine2 : regLine PORT MAP(ABUS,BBUS,Aload,Bload,Adrive,Bdrive,Arsel2, Brsel2);
	regLine3 : regLine PORT MAP(ABUS,BBUS,Aload,Bload,Adrive,Bdrive,Arsel3, Brsel3);
	regLine4 : regLine PORT MAP(ABUS,BBUS,Aload,Bload,Adrive,Bdrive,Arsel4, Brsel4);
	regLine5 : regLine PORT MAP(ABUS,BBUS,Aload,Bload,Adrive,Bdrive,Arsel5, Brsel5);
	regLine6 : regLine PORT MAP(ABUS,BBUS,Aload,Bload,Adrive,Bdrive,Arsel6, Brsel6);
	regLine7 : regLine PORT MAP(ABUS,BBUS,Aload,Bload,Adrive,Bdrive,Arsel7, Brsel7);


	Aencoder : pri3to8 PORT MAP(Aregno,Arsel0,Arsel1,Arsel2,Arsel3,Arsel4,Arsel5,Arsel6,Arsel7);
	Bencoder : pri3to8 PORT MAP(Bregno,Brsel0,Brsel1,Brsel2,Brsel3,Brsel4,Brsel5,Brsel6,Brsel7);

END one;
