----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:00 09/29/2021 
-- Design Name: 
-- Module Name:    BIN_TO_BCD - Behavioral 
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


entity BIN_TO_BCD is
	Port( 	BIN : in  STD_LOGIC_VECTOR(11 downto 0);
			BCD : out  STD_LOGIC_VECTOR(15 downto 0)
		);
end BIN_TO_BCD;

architecture Behavioral of BIN_TO_BCD is
	SIGNAL digit_DEC : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL digit_BIN : STD_LOGIC_VECTOR(3 downto 0);


begin
	digit_BCD <= 	"0000" when (digit_BIN = x"0") else -- 0
					"0001" when (digit_BIN = x"1") else -- 1
					"0010" when (digit_BIN = x"2") else -- 2
					"0011" when (digit_BIN = x"3") else -- 3
					"0100" when (digit_BIN = x"4") else -- 4
					"0101" when (digit_BIN = x"5") else -- 5
					"0110" when (digit_BIN = x"6") else -- 6
					"0111" when (digit_BIN = x"7") else -- 7
					"1000" when (digit_BIN = x"8") else -- 8
					"1001" when (digit_BIN = x"9") else -- 9
					"0000";

end Behavioral;

