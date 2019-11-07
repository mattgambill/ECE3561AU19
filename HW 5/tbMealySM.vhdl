ENTITY tbMealySM IS
END tbMealySM;

ARCHITECTURE one OF tbMealySM IS
	-- DECLARATIONS
	COMPONENT mealySM
		PORT(clk,x,POR: IN BIT; z: OUT bit);
	END COMPONENT;
	FOR ALL : mealySM USE ENTITY work.mealySM(BEHAVIORAL);

	SIGNAL xs : BIT_VECTOR(1 TO 40) := ('0','0','0','0','0','1','0','1','0','0','1','1','1','1','0','0','1','0','0','0','0','1','1','1','1','1','0','1','0','1','0','0','1','0','0','0','0','0','0','0');
	SIGNAL clk : BIT :='1';
	SIGNAL x,z : BIT := '0';
	SIGNAL POR : BIT := '0';
	SIGNAL i : integer:= 1;
	BEGIN
		m0 : mealySM PORT MAP(clk,x,POR,z);
		-- DECLARE CLOCK PROCESS
		--PROCESS
		--BEGIN
		clk <= NOT clk AFTER 5 ns;
		
		
		--END PROCESS;
		-- DECLARE STIMULUS PROCESS
		PROCESS(clk)
		BEGIN
		IF(i<40) THEN
		x <= xs(i);
		i <= i+1;
		ELSE		
		POR <= '1';
		END IF;
		
		END PROCESS;
	
END one;
