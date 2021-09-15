----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:05 09/14/2021 
-- Design Name: 
-- Module Name:    divide_clk - Behavioral 
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

entity D_LATCH is
    Port ( D, CLK : in  STD_LOGIC;
           S : out  STD_LOGIC
			);
end D_LATCH;

architecture Behavioral of D_LATCH is
begin
		PRO_D_LATCH : process (CLK)
		begin
				if (CLK'event and CLK='1') then
						S <= D;
				end if;
		end process PRO_D_LATCH;
end Behavioral;

