----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:08 09/30/2021 
-- Design Name: 
-- Module Name:    ADD3 - Behavioral 
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

entity ADD3 is
	port(
			data_in	: in	STD_LOGIC_VECTOR(3 downto 0);
			data_out	: out	STD_LOGIC_VECTOR(3 downto 0)
	);
end ADD3;

architecture Behavioral of ADD3 is
begin
	data_out <= "0000" when (data_in = "0000") else -- 0
					"0001" when (data_in = "0001") else -- 1
					"0010" when (data_in = "0010") else -- 2
					"0011" when (data_in = "0011") else -- 3
					"0100" when (data_in = "0100") else -- 4
					"1000" when (data_in = "0101") else -- 5
					"1001" when (data_in = "0110") else -- 6
					"1010" when (data_in = "0111") else -- 7
					"1011" when (data_in = "1000") else -- 8
					"1100" when (data_in = "1001") else -- 9
					"0000";
end Behavioral;

