ENTITY mealySM IS
PORT(clk,x, POR : IN BIT;
	z : OUT BIT);
END mealySM;
ARCHITECTURE BEHAVIORAL OF mealySM IS
	TYPE state_type IS (s0,s1,s2,s3,s4,s5);
	SIGNAL state, next_state : state_type;
BEGIN
	-- FLIP FLOP PROCESS
	PROCESS
	BEGIN
		Wait UNTIL clk='1'  AND clk'event;
		state <= next_state;
	END PROCESS;
	
	--NEXT STATE LOGIC
	PROCESS(state,x,POR)
	BEGIN
	CASE state IS
	WHEN s0 => IF(POR='1') THEN next_state <= s0;
		ELSE IF(x='0') THEN next_state <= s1;
			ELSE next_state <= s4;
		     END IF;
		END IF;
	WHEN s1 => IF(POR='1') THEN next_state <= s0;
		ELSE IF(x='0') THEN next_state <= s1;
			ELSE next_state <= s2;
		     END IF;
		END IF;	
	WHEN s2 => IF(POR='1') THEN next_state <= s0;
		ELSE IF(x='0') THEN next_state <= s3;
			ELSE next_state <= s4;
		     END IF;
		END IF;	
	WHEN s3 => IF(POR='1') THEN next_state <= s0;
		ELSE IF(x='0') THEN next_state <= s5;
			ELSE next_state <= s2;
		     END IF;
		END IF;	
	WHEN s4 => IF(POR='1') THEN next_state <= s0;
		ELSE IF(x='0') THEN next_state <= s3;
			ELSE next_state <= s4;
		     END IF;
		END IF;	
	WHEN s5 => IF(POR='1') THEN next_state <= s0;
		ELSE IF(x='0') THEN next_state <= s1;
			ELSE next_state <= s2;
		     END IF;
		END IF;		
		
	END CASE;
	END PROCESS;
	
	--OUTPUT Logic
	PROCESS (state,x)
	BEGIN
		CASE state IS

		WHEN s1 => IF(x='1') THEN z <= '1';
				ELSE z <='0';
				END IF;
		WHEN s2 => IF(x='0') THEN z<='1';
				ELSE z <='0';
				END IF;

		WHEN s5 => IF(x='1') THEN z<='1';
				ELSE z <='0';
				END IF;
		WHEN OTHERS => z <='0';
	END CASE;
	END PROCESS;
END BEHAVIORAL;

