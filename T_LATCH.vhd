----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:14 09/14/2021 
-- Design Name: 
-- Module Name:    T_LATCH - Behavioral 
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

entity T_LATCH is
    Port ( T, CLK : in  STD_LOGIC;
           S : out  STD_LOGIC
			);		
end T_LATCH;


architecture Behavioral of T_LATCH is
signal S_INTERNAL : std_logic;
begin
		PRO_T_LATCH : process (CLK)
		begin
				if (CLK'event and CLK='1') then
					if (T = '1') then
						S_INTERNAL <= NOT(S_INTERNAL);
					end if;
				end if;
		end process PRO_T_LATCH;
		S <= S_INTERNAL;
end Behavioral;




						

