----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:34:49 09/15/2021 
-- Design Name: 
-- Module Name:    CLOCK_DIV - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CLOCK_DIV is
    Port ( RST, CLK	: in		STD_LOGIC;
			  SPEED		: in		INTEGER RANGE 0 TO 100000000;
			  S			: out  	STD_LOGIC
			);
end CLOCK_DIV;


architecture Behavioral of CLOCK_DIV is
		SIGNAL TMP	: STD_LOGIC;
		SIGNAL COUNT: INTEGER RANGE 0 TO 100000000 := 0; -- WHY 124999 ? -> (Fin/Fout)/2 - 1     249999999
begin
		PRO_CLOCK_DIV : process (RST, CLK) -- Reset is an Sync signal
		begin
				if (RST = '1') THEN
						TMP <= '0';
						COUNT <= 0;
				elsif rising_edge(CLK) THEN--(CLK'event and CLK='1') THEN
						IF (COUNT >= SPEED) THEN
								TMP <= '1';
								COUNT <= 0;
						ELSE
								TMP <= '0';
								COUNT <= COUNT + 1;
						END IF;
				end if;
		end process PRO_CLOCK_DIV;
		
		S <= TMP;
end Behavioral;

