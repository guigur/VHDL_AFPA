----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:24:56 09/15/2021 
-- Design Name: 
-- Module Name:    BCD_COUNTER - Behavioral 
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
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all; --Magic library to add numbers
entity BCD_COUNTER is
	PORT(
			CLK, INC	: IN 	STD_LOGIC;
			S			: OUT	STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
end BCD_COUNTER;

architecture Behavioral of BCD_COUNTER is
--SIGNAL DEC_COUNTER: STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL DIGITS: STD_LOGIC_VECTOR(15 DOWNTO 0);
begin
			
								
		PRO_BCD_COUNTER : process(CLK)
		BEGIN
				IF (rising_edge(CLK)) THEN
						IF (INC = '1') THEN	
							--DEC_COUNTER <= DEC_COUNTER + 1;
							--	IF (DEC_COUNTER > x"270F") THEN --9999
							--		DEC_COUNTER <=0;
							--	END IF;
								DIGITS(3 downto 0) <= DIGITS(3 downto 0) + 1;
								IF (DIGITS(3 downto 0) >= x"9") THEN
										DIGITS(3 downto 0) <= x"0";
										
										DIGITS(7 downto 4) <= DIGITS(7 downto 4) + 1;
										IF (DIGITS(7 downto 4) >= x"9") THEN
												DIGITS(7 downto 4) <= x"0";
												
												DIGITS(11 downto 8) <= DIGITS(11 downto 8) + 1;
												IF (DIGITS(11 downto 8) >= x"9") THEN
														DIGITS(11 downto 8) <= x"0";
														
														DIGITS(15 downto 12) <= DIGITS(15 downto 12) + 1;
																IF (DIGITS(15 downto 12) >= x"9") THEN
																		DIGITS(15 downto 12) <= x"0";
														END IF;
												END IF;
										END IF;
								END IF;
								S <= DIGITS;
						END IF;
						
				END IF;
		end process PRO_BCD_COUNTER;
end Behavioral;

