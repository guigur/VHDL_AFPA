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

entity AVERAGER is
	Port(
			CE1ms		: in STD_LOGIC;
			DATA_IN	: in STD_LOGIC_VECTOR(11 downto 0);
			DATA_OUT	: out STD_LOGIC_VECTOR(11 downto 0)
	);
end AVERAGER;

architecture Behavioral of AVERAGER is
SIGNAL DATA_BUF : STD_LOGIC_VECTOR(20 downto 0);
begin

	PRO_ADD_TO_BUFFER : process (CLK)
	begin
		if falling_edge(CLK) THEN
			if (CE1ms = '1') THEN
				DATA_BUF <= DATA_BUF + DATA_IN;
			end if;
		end if;
	end process PRO_ADD_TO_BUFFER
	
	PRO_COUNT_VAL : process (CLK)
	begin
		if falling_edge(CLK) THEN
			if (CE1ms = '1') THEN
				DATA_BUF <= DATA_BUF + DATA_IN;
			end if;
		end if;
	end process PRO_GEN_CLK_PMOD
	

end Behavioral;

