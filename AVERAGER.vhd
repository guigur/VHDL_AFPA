----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:23:29 10/05/2021 
-- Design Name: 
-- Module Name:    AVERAGER - Behavioral 
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
use ieee.std_logic_unsigned.all; --Magic library to add numbers

entity AVERAGER is
	Port(
			CLK, CE1ms	: in STD_LOGIC;
			DATA_IN		: in STD_LOGIC_VECTOR(11 downto 0);
			DATA_OUT		: out STD_LOGIC_VECTOR(11 downto 0)
	);
end AVERAGER;

architecture Behavioral of AVERAGER is
SIGNAL DATA_BUF : STD_LOGIC_VECTOR(19 downto 0);
SIGNAL counterVal: STD_LOGIC_VECTOR(8 downto 0);
begin
	
	PRO : process(CLK)
	begin
		if (rising_edge(CLK)) THEN
			if (CE1ms = '1') THEN
				if (counterVal = 256) THEN
					DATA_OUT <= DATA_BUF(19 downto 8);
					DATA_BUF <= (others => '0');
				else
					DATA_BUF <= DATA_BUF + DATA_IN;
				end if;
			end if;
		end if;
	end process PRO;
	
	-- PROCESS to count form 0 to 256
	PRO_COUNT_VAL : process (CLK)
	begin
		if (rising_edge(CLK)) THEN
			if (CE1ms = '1') THEN
				if (counterVal = 256) THEN
					counterVal <= (others => '0');
				else
					counterVal <= counterVal + 1;
				end if;
			end if;
		end if;
	end process PRO_COUNT_VAL;
	
end Behavioral;

